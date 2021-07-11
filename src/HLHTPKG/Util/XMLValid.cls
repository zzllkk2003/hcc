Class HLHTPKG.Util.XMLValid Extends %RegisteredObject
{

// ClassMethod Valid(fileName As %String = "c:\temp\1.xml", docName As %String = "PatientInfoRegister", ByRef errMsg As %String) As %Status

/// 执行XML文档验证，验证成功则返回1，失败返回0
///  fileName: xml 路径文件名，默认为c:\temp\1.xml
///  docName: 识别验证xml的文档类型，用于在规则表 HLHTPKG_Valid.Pattern 中区别加载对应的校验规则，默认为PatientInfoRegister
///  errMsg:	回传的校验错误信息
ClassMethod Valid(MsgStream As %Stream.GlobalCharacter, docName As %String, ByRef errMsg As %String) As %Status
{
	Kill ^HLHTTemp(docName)
	&sql(delete HLHTPKG_Valid.ErrorLog where DocName = :docName) 
	Set tSC = $$$OK
	Set CDADocName = "",tempValue=""
	
	//遍历xml文档，将文档属性值，节点值，路径放入^HLHTTemp节点下
	// 格式 ^HLHT(文档名称,xpath,序列) = 属性值
	// 序列值对应于文档中出现重复path 
	// 例如/PRPA_IN201311UV02/controlActProcess/subject/registrationRequest/subject1/patient/patientPerson/addr/item/part/@type
	#dim tR as %XML.TextReader
	//s tSC = ##class(%XML.TextReader).ParseFile(fileName,.tR)
	Set tSC = ##class(%XML.TextReader).ParseStream(MsgStream,.tR)
	If $$$ISERR(tSC){
		Set errMsg = $SYSTEM.OBJ.DisplayError(tSC)
		Quit tSC
	}
	While tR.Read(){
		If (tR.NodeType = "element"){
			Set path = tR.Path
			Set:(CDADocName="") CDADocName=path
     	For a = 1:1:tR.AttributeCount {
    		Do tR.MoveToAttributeIndex(a)
				Set atr = path_"/@"_tR.LocalName
				Set strValue = tR.Value
				If $DATA(^HLHTTemp(docName,atr)){
					Set i=1
					While($DATA(^HLHTTemp(docName,atr,i))){
						Set i=i+1
					}
					Set ^HLHTTemp(docName,atr,i)=strValue
				}Else{
					Set ^HLHTTemp(docName,atr)=strValue
				}
     }
		}	
	}
	
	
	
	New SQLCODE,%ROWCOUNT,%ROWID,%msg
	
	//遍历规则表 HLHTPKG_Valid.Pattern 
	&sql(declare c1 cursor for 
		select id,node,seq,Cardinality,Flag,Expression,FixedValue,MetaDatatype,Reference 
		into :Allfields() 
		from HLHTPKG_Valid.Pattern
		where DocName = :docName
	)
  
  &sql(Open c1)
  If SQLCODE'=0{
  	Set msg = %msg
  	Quit 0
  }
	//  	q:(SQLCODE'=0)
  &sql(fetch c1)

  While(SQLCODE = 0){
	  	Set node="",nodeValue="",cardinality=""
	  	Set node = $ZSTRIP(Allfields(9),"*WC")
	  	//序列值对应
	  	Set seq = Allfields(11) // 获取序列值
	  	If seq=""{
	  		Set:($DATA(^HLHTTemp(docName,CDADocName_node))) nodeValue = ^HLHTTemp(docName,CDADocName_node)
	  	}Else{
		  	Set nodeValue = ^HLHTTemp(docName,CDADocName_node,seq)
	  	}  	
	  	Set cardinality = $ZSTRIP(Allfields(2),"*WC")
	  	// 验证重复性
	  	If '..ValidCard(nodeValue, cardinality){
		  	Do ..WriteLog(docName,node,"规则id /"_Allfields(1)_"/, 基数验证失败: 节点值为 /"_nodeValue_"/, 基数值应为 /"_cardinality_"/。")
	  	}Else{
		  	Set flag = $ZSTRIP($ZCONVERT(Allfields(7),"U"),"*W")
		  	
		  	If (flag="FIX"){ // 验证固定值
		  		Set fixedValue = Allfields(6)
			  	Do:('..ValidFix(nodeValue,fixedValue)) ..WriteLog(docName,node,"规则id /"_Allfields(1)_"/, 固定值验证失败: 节点值为 /"_nodeValue_"/, 固定值应为 /"_fixedValue_"/。")
		  	}ElseIf(flag="EXPRESSION"){ // 验证表达式，对应于在规则中定义AN..50，DT14
			  	Set expression = Allfields(5)
			  	Set metaDatatype = Allfields(8)
			  	If '..ValidExpression(nodeValue,expression,metaDatatype){
				  	Do ..WriteLog(docName,node,"规则id /"_Allfields(1)_"/, 标识符格式验证失败：节点值为 /"_nodeValue_"/, 格式应为 /"_metaDatatype_"|"_expression_"/。")
			  	}
		  	}ElseIf(flag="REF"){ // 验证引用，对应于规则中定义了DE02.01.030.00
		  		Set reference = Allfields(10)
			  	If '..ValidRef(nodeValue,reference,$PIECE(node,"@",*),.msg){
				  	Do ..WriteLog(docName,node,"规则id /"_Allfields(1)_"/,"_msg)
			  	}
		  	}Else {
				  	Do ..WriteLog(docName,node,"规则id /"_Allfields(1)_"/, 校验规则表 HLHTPKG_Valid.Pattern 中的 Flag 字段值不合规：flag 值为 /"_flag_"/。")
		  	}
	  	}
  		&sql(fetch c1)
  }
  &sql(close c1)
  
  // 收集错误信息并返回
  &sql(select count(*),list(msg) into :count, :msg from HLHTPKG_Valid.ErrorLog where DocName=:docName)
  Set errMsg=msg
  Quit count=0 
  
  //quit 0
}

/// 验证是否必填项, 验证通过返回1，验证失败返回0
/// value：验证节点的值
/// cardinality: 规则中定义的值
ClassMethod ValidCard(value As %String, cardinality As %String) As %Boolean
{
	Set lowCard = $PIECE(cardinality,"..")
	Quit:(value="") 'lowCard
	Quit 1
}

/// 验证固定值，验证通过返回1，验证失败返回0
/// value: 验证节点的值
/// fix: 规则中定义的固定值
ClassMethod ValidFix(value As %String, fix As %String) As %Boolean
{
	Quit value = fix
}

// "^([\u4E00-\u9FEF]|[a-z]|[A-Z]|[0-9]){0,5}" 中文，英文，数字 0到5位

/// 验证表达式，验证通过返回1，验证失败返回0
/// value: 验证节点的值
/// express: 规则中定义的表达式，比如AN50
/// metaDatatype: 规则中定义的数据类型，比如S1,S2,D
ClassMethod ValidExpression(value As %String, express As %String, metaDatatype As %String) As %Boolean
{
	Set mDT = $ZCONVERT(metaDatatype,"U")
	If mDT="S1"{
		If express["AN"{
			Set pattern="(\w"
			Set rep=$EXTRACT(express,3,*)
		}ElseIf express["A"{
			Set pattern="^([\u4E00-\u9FEF]|[a-z]|[A-Z]"
			Set rep=$EXTRACT(express,2,*)
		}ElseIf express["N"{
			Set pattern="(\d"			
			Set rep=$EXTRACT(express,2,*)
		}Else{
			Set pattern="(\w"
			Set rep=$EXTRACT(express,3,*)
		}
		Set pattern=pattern_")"
		
		Set:$FIND(rep,"..") rep=$REPLACE(rep,"..",",")
		Set:$PIECE(rep,",")="" rep="0"_rep
		Set pattern = pattern_"{"_rep_"}"
		//w "!!!!!!!!!pattern:"_pattern_";value:"_value,!
		Quit $MATCH(value,pattern)
		
	}ElseIf mDT="DT"{
		Set n = $EXTRACT(value,3,*)
		Quit:(n=14) value?14N
		Quit:(n=15) value?8N1"T"6N
	}Else{
	}
	Quit 1
}

/// 验证引用类型，验证通过返回1，验证失败返回0
/// value: 验证节点的值
/// ref:	引用表值，比如DE02.01.030.00
/// tag:	标签，用于标识验证节点为字典表中的Code字段或者是 Value 字段
/// msg:  返回的验证失败错误信息，信息包含：节点xpath, 规则表id, 验证失败内容，验证节点的值，规则表的值
/// 例如：PatientInfoRegister;/controlActProcess/subject/registrationRequest/author/assignedEntity/id/item/@extension;规则id /64/, 标识符格式验证失败：节点值为 /登记人ID/, 格式应为 /S1|AN50/
ClassMethod ValidRef(value As %String, ref As %String, tag As %String, ByRef msg As %String) As %Boolean
{
	Set msg=""
	&sql(select MetaDatatype,Expression,AllowValues into :mDT,:exp,:alV from HLHTPKG_Term.DataSet where metaid=:ref)
	If mDT="S2"{ // AllowValues字段列出允许值 如：1.中药饮片处方 2.中成药处方
		If alV'[value {
			Set msg = "引用 /"_ref_"/ 在 Term.DataSet 表中校验失败,节点值为 /"_value_"/,允许值为 /"_alv_"/。"
			Quit 0
		} 
	}ElseIf mDT = "S3"{ // AllowValues字段列出Term.Range表中的引用字段 如：CV02.01.101
		If ($ZCONVERT(tag,"U")="CODE"){
			&sql(select list(Value) into :codes from HLHTPKG_Term.Range where DataValueCode = :alV)
			If codes'[value {
				Set msg = "aaaaaa引用 /"_alV_"/ 在 Term.Range 表中校验失败,节点值为 /"_value_"/,允许值为 /"_codes_"/。"
				Quit 0
			} 
		}ElseIf($ZCONVERT(tag,"U")="VALUE"){
			&sql(select list(Description) into :deses from HLHTPKG_Term.Range where DataValueCode = :alV)
			If deses'[value {
				Set msg = "引用 /"_alV_"/ 在 Term.Range 表中校验失败,节点值为 /"_value_"/,允许值为 /"_deses_"/。"
				Quit 0
			} 
		}
	}ElseIf mDT="S1"{
		If ('..ValidExpression(value,exp,mDT)){
			Set msg = "引用 /"_ref_"/ 在 Term.DataSet 表中校验失败,节点值为 /"_value_"/,MetaDatatype值为 /"_mDT_"/,expression为 /"_exp_"/。"
			Quit 0
		}
	}ElseIf(mDT="D"){
		Set n = $EXTRACT(value,2,*)
		If '(value?@(n_"N")){
			Set msg = "引用 /"_ref_"/ 在 Term.DataSet 表中校验失败,节点值为 /"_value_"/,MetaDatatype值为 /"_mDT_"/,expression为 /"_exp_"/。"			
		}
		//q:(n=8) value?8N
	}Else {
		Set msg = "引用 /"_ref_"/ 在 Term.DataSet 表中校验失败,MetaDatatype值为 /"_mDT_"/,允许值为 /S1,S2,S3/。"
		Quit 0
	}
	Quit 1
}

/// 将错误信息写入记录表
/// docName: 文档名称
/// node: 节点xpath
/// msg: 记录的内容
ClassMethod WriteLog(docName As %String, node As %String, msg As %String)
{
	Write docName_";"_node_";"_msg,!
	&sql(insert into HLHTPKG_Valid.ErrorLog (DocName,Node,Msg) values (:docName,:node,:msg))
}

ClassMethod MyTest()
{
   //SET mydata(1,1)="a",mydata(1,3)="c",mydata(1,3,1)="lcase",mydata(1)="A",mydata(1,7)="g"
   Set mydata(1)="a"
   Set key=$ORDER(mydata(1,""),1,target)
   While (key'="") {
     Write key," = ",target,!
     // Get next subscript 
     Set key = $ORDER(mydata(1,key),1,target)
   }
}

}
