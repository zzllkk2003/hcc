Class HLHTPKG.Util.XMLValid Extends %RegisteredObject
{

/// sdfads
ClassMethod Valid(fileName As %String = "c:\temp\1.xml", docName As %String = "PatientInfoRegister") As %String
{
	k ^HLHTTemp(docName)
	s tSC = $$$OK
	s CDADocName = "",tempValue=""
	#dim tR as %XML.TextReader
	s tSC = ##class(%XML.TextReader).ParseFile(fileName,.tR)
	w:$$$ISERR(tSC) $System.OBJ.DisplayError(tSC)
	while tR.Read(){
		if (tR.NodeType = "element"){
			s path = tR.Path
			s:(CDADocName="") CDADocName=path
     	for a = 1:1:tR.AttributeCount {
    		d tR.MoveToAttributeIndex(a)
				s atr = path_"/@"_tR.LocalName
				s strValue = tR.Value
				if $d(^HLHTTemp(docName,atr)){
					s i=1
					while($d(^HLHTTemp(docName,atr,i))){
						s i=i+1
					}
					s ^HLHTTemp(docName,atr,i)=strValue
				}else{
					s ^HLHTTemp(docName,atr)=strValue
				}
     }
		}	
	}
	
	
	//s tSC = ##class(%XML.XPATH.Document).CreateFromFile(fileName,.tDoc,,,,,"nsp urn:hl7-org:v3")
	//w:$$$ISERR(tSC) $System.OBJ.DisplayError(tSC)
	
	NEW SQLCODE,%ROWCOUNT,%ROWID,%msg
	
	//&sql(select id, node,seq,Cardinality,Flag,Expression,FixedValue,MetaDatatype,Reference into :Allfields() from HLHTPKG_Valid.Pattern where DocName = :docName)
	&sql(declare c1 cursor for 
		select id,node,seq,Cardinality,Flag,Expression,FixedValue,MetaDatatype,Reference 
		into :Allfields() 
		from HLHTPKG_Valid.Pattern
		where DocName = :docName
	)
  
  &sql(Open c1)
  	q:(SQLCODE'=0)
  &sql(fetch c1)

  while(SQLCODE = 0){
	  	s node="",nodeValue="",cardinality=""
	  	s node = $zstrip(Allfields(9),"*WC")
	  	s seq = Allfields(11)
	  	if seq=""{
	  		s:($d(^HLHTTemp(docName,CDADocName_node))) nodeValue = ^HLHTTemp(docName,CDADocName_node)
	  	}else{
		  	s nodeValue = ^HLHTTemp(docName,CDADocName_node,seq)
	  	}  	
	  	s cardinality = $zstrip(Allfields(2),"*WC")
	  	if '..ValidCard(nodeValue, cardinality){
		  	d ..WriteLog(docName,node,"规则id /"_Allfields(1)_"/, 基数验证失败: 节点值为 /"_nodeValue_"/, 基数值应为 /"_cardinality_"/。")
	  	}else{
		  	s flag = $zstrip($zcvt(Allfields(7),"U"),"*W")
		  	if (flag="FIX"){
		  		s fixedValue = Allfields(6)
			  	d:('..ValidFix(nodeValue,fixedValue)) ..WriteLog(docName,node,"规则id /"_Allfields(1)_"/, 固定值验证失败: 节点值为 /"_nodeValue_"/, 固定值应为 /"_fixedValue_"/。")
		  	}elseif(flag="EXPRESSION"){
			  	s expression = Allfields(5)
			  	s metaDatatype = Allfields(8)
			  	if '..ValidExpression(nodeValue,expression,metaDatatype){
				  	d ..WriteLog(docName,node,"规则id /"_Allfields(1)_"/, 标识符格式验证失败：节点值为 /"_nodeValue_"/, 格式应为 /"_metaDatatype_"|"_expression_"/。")
			  	}
		  	}elseif(flag="REF"){
		  		s reference = Allfields(10)
			  	if '..ValidRef(nodeValue,reference,$p(node,"@",*),.msg){
				  	d ..WriteLog(docName,node,"规则id /"_Allfields(1)_"/,"_msg)
			  	}
		  	}else {
				  	d ..WriteLog(docName,node,"规则id /"_Allfields(1)_"/, 校验规则表 HLHTPKG_Valid.Pattern 中的 Flag 字段值不合规：flag 值为 /"_flag_"/。")
		  	}
	  	}
  		&sql(fetch c1)
  }
  &sql(close c1)
  
  q 1
}

ClassMethod ValidCard(value As %String, cardinality As %String) As %Boolean
{
	s lowCard = $p(cardinality,"..")
	q:(value="") 'lowCard
	q 1
}

ClassMethod ValidFix(value As %String, fix As %String) As %Boolean
{
	q value = fix
}

// "^([\u4E00-\u9FEF]|[a-z]|[A-Z]|[0-9]){0,5}" 中文，英文，数字 0到5位

ClassMethod ValidExpression(value As %String, express As %String, metaDatatype As %String) As %Boolean
{
	s mDT = $zcvt(metaDatatype,"U")
	if mDT="S1"{
		if express["AN"{
			s pattern="(\w"
			s rep=$e(express,3,*)
		}elseif express["A"{
			s pattern="^([\u4E00-\u9FEF]|[a-z]|[A-Z]"
			s rep=$e(express,2,*)
		}elseif express["N"{
			s pattern="(\d"			
			s rep=$e(express,2,*)
		}else{
			s pattern="(\w"
			s rep=$e(express,3,*)
		}
		s pattern=pattern_")"
		
		s:$f(rep,"..") rep=$replace(rep,"..",",")
		s:$p(rep,",")="" rep="0"_rep
		s pattern = pattern_"{"_rep_"}"
		//w "!!!!!!!!!pattern:"_pattern_";value:"_value,!
		q $match(value,pattern)
		
	}elseif mDT="DT"{
		s n = $e(value,3,*)
		q:(n=14) value?14N
		q:(n=15) value?8N1"T"6N
	}else{
	}
	q 1
}

ClassMethod ValidRef(value As %String, ref As %String, tag As %String, ByRef msg As %String) As %Boolean
{
	s msg=""
	&sql(select MetaDatatype,Expression,AllowValues into :mDT,:exp,:alV from HLHTPKG_Term.DataSet where metaid=:ref)
	if mDT="S2"{ // AllowValues字段列出允许值 如：1.中药饮片处方 2.中成药处方
		if alV'[value {
			s msg = "引用 /"_ref_"/ 在 Term.DataSet 表中校验失败,节点值为 /"_value_"/,允许值为 /"_alv_"/。"
			q 0
		} 
	}elseif mDT = "S3"{ // AllowValues字段列出Term.Range表中的引用字段 如：CV02.01.101
		if ($zcvt(tag,"U")="CODE"){
			&sql(select list(Value) into :codes from HLHTPKG_Term.Range where DataValueCode = :alV)
			if codes'[value {
				s msg = "aaaaaa引用 /"_alV_"/ 在 Term.Range 表中校验失败,节点值为 /"_value_"/,允许值为 /"_codes_"/。"
				q 0
			} 
		}elseif($zcvt(tag,"U")="VALUE"){
			&sql(select list(Description) into :deses from HLHTPKG_Term.Range where DataValueCode = :alV)
			if deses'[value {
				s msg = "引用 /"_alV_"/ 在 Term.Range 表中校验失败,节点值为 /"_value_"/,允许值为 /"_deses_"/。"
				q 0
			} 
		}
	}elseif mDT="S1"{
		if ('..ValidExpression(value,exp,mDT)){
			s msg = "引用 /"_ref_"/ 在 Term.DataSet 表中校验失败,节点值为 /"_value_"/,MetaDatatype值为 /"_mDT_"/,expression为 /"_exp_"/。"
			q 0
		}
	}elseif(mDT="D"){
		s n = $e(value,2,*)
		if '(value?@(n_"N")){
			s msg = "引用 /"_ref_"/ 在 Term.DataSet 表中校验失败,节点值为 /"_value_"/,MetaDatatype值为 /"_mDT_"/,expression为 /"_exp_"/。"			
		}
		//q:(n=8) value?8N
	}else {
		s msg = "引用 /"_ref_"/ 在 Term.DataSet 表中校验失败,MetaDatatype值为 /"_mDT_"/,允许值为 /S1,S2,S3/。"
		q 0
	}
	q 1
}

ClassMethod WriteLog(docName As %String, node As %String, msg As %String)
{
	w docName_";"_node_";"_msg,!
}

ClassMethod MyTest()
{
   //SET mydata(1,1)="a",mydata(1,3)="c",mydata(1,3,1)="lcase",mydata(1)="A",mydata(1,7)="g"
   SET mydata(1)="a"
   SET key=$ORDER(mydata(1,""),1,target)
   WHILE (key'="") {
     WRITE key," = ",target,!
     // Get next subscript 
     SET key = $ORDER(mydata(1,key),1,target)
   }
}

}
