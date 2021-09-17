Include %msql

Class HCC.SQL.QPTools Extends %RegisteredObject [ Not ProcedureBlock ]
{

/// 查询表的字段信息，及定义该字段的类名
Query SQLFields(table As %String(MAXLEN=257)) As %Query(ROWSPEC = "FIELD_NAME:%String,XDBCDATATYPE:%String,DATATYPE:%String,COLUMN_NUMBER:%Integer,REQUIRED:%String,UNIQUE:%String,COLLATION_FUNCTION:%String,HIDDEN:%String,MAXLEN:%String,BLOB:%String,REFERENCE:%String,CONTAINER_FIELD:%Library.String,ODBC_DATATYPE_CODE:%Library.SmallInt,JDBC_DATATYPE_CODE:%Library.SmallInt,COLLECTION_TYPE:%Library.String,REF_ID_DATATYPE:%Library.String,ELEMENT_TYPE:%Library.String,REFERENCE_CLASS:%Library.String,INSERTABLE:%Library.String(MAXLEN=3),UPDATEABLE:%Library.String(MAXLEN=3),DEFAULT:%String(MAXLEN=255),ROWIDWITHODBCVALUES:%String(MAXLEN=3),SERIAL_FIELD:%String(MAXLEN=3),ROWID_FIELD:%SmallInt,ORIGINATING_PROPERTY:%Library.String(MAXLEN=40),CONTAINER_TYPE:%Library.String(MAXLEN=100),MAXVAL:%Library.String,MINVAL:%Library.String") [ SqlProc ]
{
}

ClassMethod SQLFieldsExecute(ByRef %q As %Binary, table As %String(MAXLEN=257)) As %Status [ Internal ]
{

    #;  
     #;  %q(1) = Extent Name
     #;  %q(2) = Field icol $Order loop variable
     #;  %q(2,icol) = Field Name
     #;  %q(3) = Extent Info
    set %q(1)=""
    QUIT:$g(table)="" $$$OK
    set:table'["." table=$$$DefaultSchema_"."_table // was an unqualified name
    set %q(1)=$$$GetExtentNameFromIQN(table) QUIT:%q(1)="" $$$OK
    if $$$GetTableTypeFromIQN(table)'=1 { set %q(1)="" QUIT $$$OK } // Not a table
    set %q(3)=$$$EXTsqlinfo($$$rEXT,%q(1))
    new d,x set x="",%q(2)=""
    for  { set x=$o($$$EXTSQLCOL($$$rEXT,%q(1),x)) quit:x=""  set d=$$$EXTSQLCOLsqlinfo($$$rEXT,%q(1),x),%q(2,$$$SQLLocColNumber(d))=x }
    QUIT $$$OK
}

ClassMethod SQLFieldsFetch(ByRef %q As %Binary, ByRef Row As %List, AtEnd As %Integer) As %Status [ Internal, ProcedureBlock = 1 ]
{

    set AtEnd=0,Row=""
    if %q(1)="" { set AtEnd=1 QUIT $$$OK }
    set %q(2)=$o(%q(2,%q(2)),1,fieldname)
    if %q(2)="" { set AtEnd=1 QUIT $$$OK }
    set fldinfo=$$$EXTSQLCOLsqlinfo($$$rEXT,%q(1),fieldname)

    if $$$SQLLocColReferencedTable(fldinfo)'="" {
        set refclass=$$$GetClassNameFromIQN($$$SQLLocColReferencedTable(fldinfo))
        set refext=$$$GetExtentNameFromIQN($$$SQLLocColReferencedTable(fldinfo))
        set refextinfo=$$$EXTsqlinfo($$$rEXT,refext)
        set refid=$$$SQLLocTableRowIDField(refextinfo)
        set refidinfo=$$$EXTSQLCOLsqlinfo($$$rEXT,refext,refid)
        set reftype=$$$SQLLocColDatatype(refidinfo)
    }
    else { set reftype="",refclass="" }
    set type=$$$SQLLocColDatatype(fldinfo)
    set odbctype=$$$comClassKeyGet(type,$$$cCLASSodbctype)
    if $$$SQLLocColListCollection(fldinfo)="Y" { set collectiontype="LIST" } elseif $$$SQLLocColArrayCollection(fldinfo)=1 { set collectiontype="ARRAY" } else { set collectiontype="" }
    if collectiontype'="" { set elementtype=$$$UPPER($$$getClassType(type)) } else { set elementtype="" }
    set insertable="Yes",updateable="Yes"
        #; If system generated value or always equal computed, can't ins/upd
    set:$$$SQLLocColSystemGeneratedValue(fldinfo)=1||($$$SQLLocColComputedAlways(fldinfo)="Y")||(type="%Library.RowVersion") insertable="No",updateable="No"
        #; If IDKEY field, can't update
    set:$lf($$$SetSQLLocTableRowIDLogicalFields(%q(3)),fieldname) updateable="No"
    if $$$SetSQLLocColNumber(fldinfo)=1 { do GetMethCode^%qaqcdt(%q(1),fieldname,.code,"OdbcToLogical") if $g(code) { set code="Yes" } else { set code="No" } } else { set code="" }
    if $$$getClassType(type)=$$$cCLASSCLASSTYPESERIAL,collectiontype'="LIST",collectiontype'="ARRAY",$$$SQLLocColStream(fldinfo)'=1 { set sf="Yes" } else { set sf="No" }
    set collate=$$$SQLLocColCollation(fldinfo)
    set maxlen="",minval="",maxval=""
    if $$$SQLLocColTypeParameters(fldinfo)'="" {
        set parms=$$$SQLLocColTypeParameters(fldinfo)
        for i=1:1:$ll(parms) {
            if $lg(parms,i)["MAXLEN=" { set maxlen=$p($lg(parms,i),"=",2) }
            if $lg(parms,i)["MAXVAL=" { set maxval=$p($lg(parms,i),"=",2) }
            if $lg(parms,i)["MINVAL=" { set minval=$p($lg(parms,i),"=",2) }
        }
    }
    set rowid=$s($$$SQLLocColNumber(fldinfo)=1:1,$$$SQLLocColNumber(fldinfo)=0:2,$lf($$$SQLLocTableRowIDLogicalFields(%q(3)),fieldname):2,1:0)
    set Row=$lb(fieldname,$$$SQLLocColxDBCType(fldinfo),type,$$$SQLLocColNumber(fldinfo),$s($$$SQLLocColRequired(fldinfo)="Y":"Yes",1:"No"),$s($$$SQLLocColUnique(fldinfo)="Y":"Yes",1:"No"),$s(collate="A":"ALPHAUP",collate="U":"UPPER",collate="E":"EXACT",collate="P":"PLUS",collate="M":"MINUS",collate="MV":"MVR",collate="S":"SPACE",collate="T":"STRING",collate["T(":"STRING"_"("_$p(collate,"(",2),collate="SS":"SQLSTRING",collate["SS(":"SQLSTRING"_"("_$p(collate,"(",2),collate="SU":"SQLUPPER",collate["SU(":"SQLUPPER"_"("_$p(collate,"(",2),collate="TR":"TRUNCATE",collate["TR(":"TRUNCATE"_"("_$p(collate,"(",2),1:""),$s($$$SQLLocColHidden(fldinfo)="Y":"Yes",1:"No"),maxlen,$s($$$SQLLocColStream(fldinfo)=1:"Yes",1:"No"),$$$SQLLocColReferencedTable(fldinfo),$$$SQLLocColContainerField(fldinfo),$$$GetOdbcTypeNumber(odbctype),$$$GetJdbcTypeNumber(odbctype),collectiontype,reftype,elementtype,$g(refclass),insertable,updateable,$$$SQLLocColDefaultValue(fldinfo),$g(code),sf,rowid,$$$SQLLocColPropertyName(fldinfo),$$$SQLLocColContainerType(fldinfo),maxval,minval)
    QUIT $$$OK
}

ClassMethod SQLFieldsClose(ByRef %q As %Binary) As %Status [ Internal ]
{
    kill %q
    QUIT $$$OK
}

/// 得到类的属性说明
ClassMethod GetPropDesc(pClass, pProp) As %String
{
    Set tDesc="",tProp = pClass_"||"_pProp
    &SQL(select Description into :tDesc
    from %Dictionary.CompiledProperty 
    where ID1=:tProp)
    Quit tDesc
}

/// 得到编码型类的值集
ClassMethod GetDataSetDesc(pClass = "WS.DE.DE070000700") As %String
{
    Set pValue=""
    //先检查ValueSetDisplay
    Set tParameterId = pClass_"||"_"ValueSetDisplay"
    Set tParam=##class(%Dictionary.CompiledParameter).%OpenId(tParameterId)
    Set:(tParam'="") pValue = tParam.Default
    //如果ValueSetDisplay为空，检查ValueSet
    If pValue=""
    {
        Set tParameterId = pClass_"||"_"ValueSet"
        Set tParam=##class(%Dictionary.CompiledParameter).%OpenId(tParameterId)
        Set:(tParam'="") pValue = tParam.Default
    }
    k tParam
    Quit pValue
}

/// 产生SQL表的说明文档
ClassMethod SQLDocGenerator() As %Status
{
    //记录表，遍历字段，字段说明，值集，基数信息，用csv文件输出
    Set tFile=##class(%Stream.FileCharacter).%New()
    Do tFile.LinkToFile("c:\temp\SQLTable.csv")
    Set tFile.TranslateTable = "UTF8"
    
    // 通用说明
    Do tFile.WriteLine("整套互联互通SQL模型以HCC_SQL.Document为主文档表，所有文档首先要insert文档号和文档类型到该表。“文档号”是文档的唯一编号，不可重复；“文档类型”按WST500的编号和名称，逻辑值是1-53数字。")
    Do tFile.WriteLine("其余SQL模型以章节为单位，每个章节有一张章节表和多个子表构成。子表用于保存基数大于1的条目数据，例如《过敏章节》的过敏条目。这些表都通过“文档编号”字段关联到文档主表。")
    Do tFile.WriteLine("以下章节没有章节表，只有章节条目表。用于保存基数大于1的条目数据：")
    Do tFile.WriteLine("生命体征章节条目表：HCC_SQL_Document.VitalSign")
    Do tFile.WriteLine("社会史/个人史章节条目表：HCC_SQL_Document.SocialHistory")
    Do tFile.WriteLine("家族史章节条目表：HCC_SQL_Document.FamilyHistory")
    Do tFile.WriteLine("体格检查章节条目表：HCC_SQL_Document.PhysicalExam")
    Do tFile.WriteLine("用药管理章节条目表：HCC_SQL_Document.MedicationAdministered")
    Do tFile.WriteLine("症状章节条目表：HCC_SQL_Document.Symptom")
    Do tFile.WriteLine("护理观察章节条目表：HCC_SQL_Document.NursingObservation")
    Do tFile.WriteLine("护理操作章节条目表：HCC_SQL_Document.NursingOperation")
    Do tFile.WriteLine("高值耗材章节条目表：HCC_SQL_Document.HighValueConsumable")
    Do tFile.WriteLine("辅助检查章节条目表：HCC_SQL_Document.SupplementaryExam")
    Do tFile.WriteLine("")
    //Do tFile.WriteLine("对于“生命体征章节”和《》")


    Set tSQL = "select TABLE_SCHEMA,TABLE_NAME,CLASSNAME,DESCRIPTION from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA %Startswith 'HCC_SQL' order by TABLE_SCHEMA||'_'||TABLE_NAME",
    tSC=$$$OK
    set tStatement=##class(%SQL.Statement).%New()
    set tSC=tStatement.%Prepare(tSQL)
    if $$$ISERR(tSC) { do $system.OBJ.DisplayError(tSC) }
    set tRS=tStatement.%Execute()
    while tRS.%Next() 
    {
        Set tSchema = tRS.%Get("TABLE_SCHEMA"),tTable=tRS.%Get("TABLE_NAME"),tClass=tRS.%Get("CLASSNAME"),tTabDesc = tRS.%Get("DESCRIPTION")
        Continue:((tTable="MedicationHistory")||(tTable="LabTestbackup"))
        
        Do tFile.WriteLine("表:"_tSchema_"."_tTable)
        Do tFile.WriteLine(tTabDesc)
        // 写表头
        Do tFile.WriteLine("字段,说明,数据元,值集,xDBC数据类型,最大值,最小值")

        Do ..DescTable(tSchema_"."_tTable,tClass,.tFile)
        Do tFile.WriteLine("-----------------")
    }
    
    do tFile.%Save()
}

/// 描述表字段信息
/// 输入表的全名(schema+table)
ClassMethod DescTable(pFullTableName, pClassName, ByRef pFile) As %Status
{
    k ^||TempCol
    Set rs=##class(%Library.ResultSet).%New()
    //Set rs.ClassName="%SQLCatalog"
    Set rs.ClassName="HCC.SQL.QPTools"
    Set rs.QueryName="SQLFields"
    Set tSC=rs.Execute(pFullTableName)
    Set tDesc = "",tPreClass=""
    while rs.%Next() 
    {
        Set tColName=rs.Data("FIELD_NAME"),
        tDataType=rs.Data("DATATYPE"),
        tProp=rs.Data("ORIGINATING_PROPERTY"),
        tContainer=rs.Data("CONTAINER_TYPE"),
        tXDBCDT = rs.Data("XDBCDATATYPE"),
        tMAXVal = rs.Data("MAXVAL"),
        tMINVal = rs.Data("MINVAL"),
        tMaxLen = rs.Data("MAXLEN"),
        tHidden = rs.Data("HIDDEN")
     
        Continue:((tColName="ID")||(tColName="x__classname")||(tColName="childsub"))
        //使用临时global排序
        Set ^||TempCol(tColName)=$LB(tDataType,tProp,tContainer,tXDBCDT,tMAXVal,tMINVal,tMaxLen,tHidden)
    }
    Set (tDataType,tProp,tColName,tValueSet,tDE)=""
    Set tColName=$O(^||TempCol(tColName))
    While tColName'=""
    {
        Set tDataType = $LG(^||TempCol(tColName),1),
        tProp=$LG(^||TempCol(tColName),2),
        tPreClass = $LG(^||TempCol(tColName),3),
        tXDBCDT = $LG(^||TempCol(tColName),4),
        tMAXVal = $LG(^||TempCol(tColName),5),
        tMINVal = $LG(^||TempCol(tColName),6),
        tMaxLen = $LG(^||TempCol(tColName),7),
        tHidden = $LG(^||TempCol(tColName),8)
        
        Set:(tPreClass="") tPreClass=pClassName
        Set:((tDataType["WS") || (tDataType["%")) tDesc=tDesc_" "_..GetPropDesc(tPreClass,tProp)
        
        Set:(tDataType["WS.DT") tDE=tDataType
        if ((tDataType["%")||(tDataType["WS.DT"))
        {
            //对编码型属性，获得其值集
            If tDataType="WS.DT.CodedString"
            {
                Set tValueSet=..GetDataSetDesc(tPreClass)
            }
            
            if (tPreClass'["WS") 
            {
                Set tPreClass="无"
            }
            else
            {
                if tPreClass["WS.DE."
                {
                    Set tTemp = $P(tPreClass,"WS.DE.",2)
                    Set tPreClass=$E(tTemp,1,4)_"."_$E(tTemp,5,6)_"."_$E(tTemp,7,9)_"."_$E(tTemp,10,11)
                }
                elseif tPreClass["WS.HSDE."
                {
                    //WS.HSDE.HDSD0011142
                    Set tTemp = $P(tPreClass,"WS.HSDE.",2)
                    Set tPreClass=$E(tTemp,1,6)_"."_$E(tTemp,7,8)_"."_$E(tTemp,9,11)
                }
                
            }
            
            do:(tHidden'="Yes") pFile.WriteLine(tColName_","_tDesc_","_tPreClass_","_tValueSet_","_tXDBCDT_","_tMAXVal_","_tMINVal)
            //清除描述
            Set (tDesc,tPreClass,tValueSet,tDE)=""
        }
        
        Set tColName=$O(^||TempCol(tColName))
    }
}

/// 产出用于生成测试文档的类方法
ClassMethod GeneratePopulateDocMethod()
{
    Set SectionTable("病历摘要章节")="MRSummary"
    Set SectionTable("产后处置章节")="ProcessPostDelivery"
    Set SectionTable("产前检查章节")="PrenatalEvent"
    Set SectionTable("出院诊断章节")="HospitalDischargeDX"
    Set SectionTable("费用章节")="Payment"
    Set SectionTable("分娩评估章节")="DeliveryAssessment"
    Set SectionTable("风险章节")="Risk"
    Set SectionTable("辅助检查章节")="SupplementaryExam"
    Set SectionTable("高值耗材章节")="HighValueConsumable"
    Set SectionTable("个人史/社会史章节")="SocialHistory"
    Set SectionTable("宫剖产记录-手术操作章节")="CaesareanProcedure"
    Set SectionTable("过敏史章节")="Allergy"
    Set SectionTable("行政管理章节")="Administration"
    Set SectionTable("护理标志章节")="NursingSign"
    Set SectionTable("护理操作章节")="NursingOperation"
    Set SectionTable("护理隔离章节")="NursingIsolation"
    Set SectionTable("护理观察章节")="NursingObservation"
    Set SectionTable("护理记录章节")="NursingRecord"
    Set SectionTable("会诊意见章节")="ConsultSuggestion"
    Set SectionTable("会诊原因章节")="ConsultReason"
    Set SectionTable("既往史章节")="PastHistory"
    Set SectionTable("家族史章节")="FamilyHistory"
    Set SectionTable("检查报告章节")="CheckReport"
    Set SectionTable("检验报告章节")="LabReport"
    Set SectionTable("健康评估章节")="HealthAssessment"
    Set SectionTable("健康指导章节")="HealthGuidance"
    Set SectionTable("麻醉章节")="Anesthesia"
    Set SectionTable("皮肤章节")="Skin"
    Set SectionTable("其他处置章节")="OtherProc"
    Set SectionTable("其他相关信息章节")="Other"
    Set SectionTable("器械物品核对章节")="InstrumentVerification"
    Set SectionTable("抢救记录章节")="RescueRecord"
    Set SectionTable("入院信息章节")="AdmissionInformation"
    Set SectionTable("入院诊断章节")="HospitalAdmissionDX"
    Set SectionTable("生活方式章节")="LifeStyle"
    Set SectionTable("生命体征章节")="VitalSign"
    Set SectionTable("尸检意见章节")="AutopsyOpinion"
    Set SectionTable("失血章节")="BloodLoss"
    Set SectionTable("实验室检查章节")="LabTest"
    Set SectionTable("手术操作章节")="Procedure"
    Set SectionTable("手术过程描述章节")="ProcedureNote"
    Set SectionTable("手术评估记录标志章节")="ProcedureAssessment"
    Set SectionTable("输血章节")="BloodTransfusion"
    Set SectionTable("输液章节")="Infusion"
    Set SectionTable("术后交接章节")="PostoperationHandover"
    Set SectionTable("术后去向章节")="ProcedureDisposition"
    Set SectionTable("术后诊断章节")="SurgicalOperationNotePostoperativeDX"
    Set SectionTable("术前诊断章节")="SurgicalOperationNotePreoperativeDX"
    Set SectionTable("术前总结章节")="PreoperativeSummary"
    Set SectionTable("死亡原因章节")="DeathReason"
    Set SectionTable("四肢章节")="Extremities"
    Set SectionTable("讨论内容章节")="Discussion"
    Set SectionTable("讨论总结章节")="DiscussionSummary"
    Set SectionTable("体格检查章节")="PhysicalExam"
    Set SectionTable("卫生事件章节")="HealthcareEvent"
    Set SectionTable("现病史章节")="PresentIllnessHistory"
    Set SectionTable("新生儿章节")="NewBorn"
    Set SectionTable("一般状况检查章节")="GeneralStatus"
    Set SectionTable("医嘱章节")="ProviderOrder"
    Set SectionTable("意见章节")="Suggestion"
    Set SectionTable("阴道分娩章节")="VaginalDelivery"
    Set SectionTable("引流章节")="SurgicalDrains"
    Set SectionTable("用药管理章节")="MedicationAdministered"
    Set SectionTable("用药章节")="MedicationUseHistory"
    Set SectionTable("预防接种史章节")="Vaccination"
    Set SectionTable("月经史章节")="MenstrualHistory"
    Set SectionTable("诊断记录章节")="Diagnosis"
    Set SectionTable("症状章节")="Symptom"
    Set SectionTable("知情同意章节")="Consent"
    Set SectionTable("治疗计划章节")="TreatmentPlan"
    Set SectionTable("主诉章节")="ChiefComplaint"
    Set SectionTable("主要健康问题章节")="HealthProblem"
    Set SectionTable("住院过程章节")="HospitalCourse"
    Set SectionTable("住院史章节")="Hospitalization"
    Set SectionTable("注意事项章节")="Attention"
    Set SectionTable("转科记录章节")="Referral"
   
    Set tClass=##class(%Dictionary.ClassDefinition).%OpenId("HCC.SQL.Tools")
             
    for i=1:1:53
    {
        Set tDocMethod="GenSampleFor"_i
        Set (tSection,tSecMethod,tCode)=""
        Set tCode ="   #SQLCompile Select=ODBC "_$C(13)_$C(10)
        Set tCode = tCode_"   /// 插入文档"_$C(13)_$C(10)
        Set tCode = tCode_"   Do ..TestDocumentGenerate(pDocNo)"_$C(13)_$C(10)
        Set tCode = tCode_"   /// 插入文档头"_$C(13)_$C(10)
        Set tCode = tCode_"   Do ..TestHeaderGenerate(pDocNo)"_$C(13)_$C(10)
        
        Set tSQL="select DocumentSection from WS_DOC.DocumentConfig where DocumentType=?"
        Set rs=##class(%Library.ResultSet).%New()
        Set sc=rs.Prepare(tSQL)
        Set tSC=rs.Execute(i)
        
        while rs.%Next() 
        {
            Set tSection=rs.Data("DocumentSection")
            Set tTableName = $G(SectionTable(tSection))
            Write:(tTableName="") tSection," not exist",!
            Set:((tSection="手术操作章节")&&(i=16)) tTableName = "CaesareanProcedure"
            Set tCode = tCode_  "   ///插入"_tSection_$C(13)_$C(10)
            Set tCode = tCode_  "   Do ..Test"_tTableName_"Generate(pDocNo)"_$C(13)_$C(10)
        }
        
        Set tMethodId = "HCC.SQL.Tools||"_tDocMethod
        w tMethodId,!
        Set tMethod=##class(%Dictionary.MethodDefinition).%OpenId(tMethodId)
        if tMethod=""
        {
            Set tMethod=##class(%Dictionary.MethodDefinition).%New()
            Set tMethod.parent=tClass
            Set tMethod.Name=tDocMethod
        }
        Set tMethod.ReturnType=""
        Set tMethod.FormalSpec="pDocNo:%String"
        Do tMethod.Implementation.Write(tCode)
        Set tMethod.ClassMethod=1
        w tMethod.%Save(),!
        w tClass.%Save(),!
        Do tMethod.%Close()

    }
}

/// 为包增加父类
ClassMethod AddParentClass(pPackage = "QP.Test", pParentClass = "%XML.Adaptor") As %Status
{
    Set tSQL = "SELECT ID FROM %Dictionary.ClassDefinition WHERE ID %STARTSWITH ?"
    Set tQuery = ##class(%SQL.Statement).%New()
    Set tSC = tQuery.%Prepare(tSQL)
    Q:$$$ISERR(tSC) tSC
    Set tRS=tQuery.%Execute(pPackage_".")
    While (tRS.%Next()) 
    {
        Set tClassName = tRS.%Get("ID")
        Set tClassDef = ##class(%Dictionary.ClassDefinition).%OpenId(tClassName)
        If tClassDef.Super = ""
        {
            Set tClassDef.Super = pParentClass
        }
        Else
        {
            Set tClassDef.Super = tClassDef.Super _","_ pParentClass
        }
        Set tSC=tClassDef.%Save()
        
        Set tSC= $System.OBJ.Compile(tClassName,"-d")
    }
    Do tQuery.%Close(),tRS.%Close()

    Quit tSC
}

ClassMethod Test() As %Status
{
    Set pFullTableName="HCC_SQL_Document.RescueRecord"
    Set rs=##class(%Library.ResultSet).%New()
    Set rs.ClassName="%SQLCatalog"
    Set rs.QueryName="SQLFields"
    Set tSC=rs.Execute(pFullTableName)
    Set tDesc = "",tPreClass=""
    while rs.%Next() 
    {
        w rs.Data("FIELD_NAME"),"--",rs.Data("HIDDEN"),"--",rs.Data("ODBC_DATATYPE_CODE"),!
    }
}

ClassMethod GenInvalidData(pCount = 10)
{
    #SQLCompile Select=ODBC 

    For i=1:1:pCount
    {
        Set tDocNo = "WR20"_i
        &SQL(insert or update into HCC_SQL.Document(
        DocumentNo,
        DocumentType,
        BatchNo)
        values(
        :tDocNo,
        15,
        'A234'))
        w SQLCODE,!
        
        Set tGender=$P("0,1,2,9,男性,nan,nv,M,F",",",$R(9)+1)
        Set tHeight=$P("61,62,58,59,69,67,63cm,64.5厘米,57厘米,50,48,71",",",$R(12)+1)
        Set tWeight=$P("3031,4002,2768,2890,3265,2927,3000克,8斤2两,3.2公斤,2880,1900,3180",",",$R(12)+1)
        Set tSize=$P("乒乓球,鸡蛋,拳头,,约3cm直径大小,约6cm,7.5厘米,无",",",$R(8)+1)
        Set tPos=$P("头顶部,前囟偏左,后囟偏左,后囟偏右,额部,该患儿为枕左前。新生儿出生时，头顶左侧或右侧，或后方有瘤样隆起，即为产瘤。在分娩过程中，当胎头抵达母体骨盆底时，胎头受压颅骨互相重叠逐渐蛮形，其中在胎头最前面的部分受压最大，局部的血液循环受影响，发生水肿，形成产瘤。产瘤一般在出生后一、二天自行消失，不需处理。",",",$R(6)+1)
        
        If i#7=1
        {
            &SQL(insert %NOCHECK into HCC_SQL_Document.NewBorn(
            DocumentNo,
            gender_Value,
            height_Value,
            weight_Value)
            Values(
            :tDocNo,
            :tGender,
            :tHeight,
            :tWeight))
            /*
            w SQLCODE,!
            
            if i=1
            {
                &SQL(insert %NOCHECK into HCC_SQL_Document.NewBorn(
                DocumentNo,
                gender_Value,
                height_Value,
                weight_Value)
                Values(
                :tDocNo,
                :tGender,
                :tHeight,
                :tWeight))
                
                w "code:",SQLCODE,!
            }*/
        }
        Else
        {
            &SQL(insert %NOCHECK into HCC_SQL_Document.NewBorn(
            DocumentNo,
            gender_Value,
            height_Value,
            position_Value,
            size_Value,
            weight_Value)
            Values(
            :tDocNo,
            :tGender,
            :tHeight,
            :tPos,
            :tSize,
            :tWeight))
        }
        w SQLCODE,!
    }
}

}
