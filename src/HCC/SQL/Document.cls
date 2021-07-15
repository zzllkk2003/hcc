/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 互联互通文档SQL模型
Class HCC.SQL.Document Extends (%Persistent, %XML.Adaptor)
{

/// 地域代码: 
Parameter realmCode = "CN";

/// 文档注册模型
Parameter typeId = "POCD_HD00040";

/// 文档编号
Property DocumentNo As %String;

Index IdKey On DocumentNo [ IdKey, Unique ];

/// 文档类型
/// 按WST500的编号和名称,逻辑值是1-53数字
Property DocumentType As %String(DISPLAYLIST = ",病历概要,门(急)诊病历,急诊留观病历,西药处方,中药处方,检查报告,检验报告,治疗记录,一般手术记录,麻醉术前访视记录,麻醉记录,麻醉术后访视记录,输血记录,待产记录,阴道分娩记录,剖宫产记录,一般护理记录,病重(病危)护理记录,手术护理记录,生命体征测量记录,出入量记录,高值耗材使用记录,入院评估,护理计划,出院评估与指导,手术知情同意书,麻醉知情同意书,输血治疗同意书,特殊检查与特殊治疗同意书,病危(重)通知书,其它知情同意书,住院病案首页,中医住院病案首页,入院记录,24小时内入出院记录,25小时内入院死亡记录,住院病程记录 首次病程记录,住院病程记录 日常病程记录,住院病程记录 上级医师查房记录,住院病程记录 疑难病例讨论记录,住院病程记录 交接班记录,住院病程记录 转科记录,住院病程记录 阶段小结,住院病程记录 抢救记录,住院病程记录 会诊记录,住院病程记录 术前小结,住院病程记录 术前讨论,住院病程记录 术后首次病程记录,住院病程记录 出院记录,住院病程记录 死亡记录,住院病程记录 死亡病例讨论记录,住院医嘱,出院小结", VALUELIST = ",1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53");

/// 最后一次更新
Property LastUpdate As %TimeStamp [ InitialExpression = {$ZDATETIME($ZDATETIMEH($ZTS,-3),3,1,4)} ];

/// 文档版本
Property Version As %Integer [ InitialExpression = 1 ];

/// 是否需要更新整个文档
Property NeedGenerate As %Boolean(XMLPROJECTION = "NONE") [ InitialExpression = 0 ];

/// 文档头
Property Header As HCC.SQL.Document.Header;

/// 生命体征章节
Relationship VitalSigns As HCC.SQL.Document.VitalSign [ Cardinality = children, Inverse = DocumentNo ];

/// 诊断记录章节
Property Diagnosis As HCC.SQL.Document.Diagnosis;

/// 主要健康问题章节
Property Problem As HCC.SQL.Document.HealthProblem;

/// 转科记录章节
Property Referral As HCC.SQL.Document.Referral;

/// 出院诊断章节
Property DisDiag As HCC.SQL.Document.HospitalDischargeDX;

/// 过敏史章节
Relationship Allergies As HCC.SQL.Document.Allergy [ Cardinality = children, Inverse = DocumentNo ];

/// 实验室检查章节
Relationship LabTests As HCC.SQL.Document.LabTest [ Cardinality = children, Inverse = DocumentNo ];

/// 手术操作章节
Property Procedure As HCC.SQL.Document.Procedure;

/// 住院史章节
Property Hospitalization As HCC.SQL.Document.Hospitalization;

/// 住院过程节
Property HospitalizationProcess As HCC.SQL.Document.HospitalizationProcess;

/// 行政管理章节
Property Administration As HCC.SQL.Document.Administration;

/// 治疗计划章节
Property CarePlan As HCC.SQL.Document.TreatmentPlan;

/// 费用章节
Property Payment As HCC.SQL.Document.Payment;

/// SQL插入后, 触发互联互通文档生成
Trigger GenerateHCCDocumentInsert [ Event = INSERT, Time = AFTER ]
{
    Do ##class(HCC.SQL.Tools).GenerateHCCDocument()
}

/// SQL更新后, 触发互联互通文档生成
Trigger GenerateHCCDocumentUpdate [ Event = UPDATE, Time = AFTER ]
{
    Do ##class(HCC.SQL.Tools).GenerateHCCDocument()
}

/// SQL更新后, 触发互联互通文档生成
Trigger GenerateHCCDocumentDelete [ Event = DELETE, Time = AFTER ]
{
    Do ##class(HCC.SQL.Tools).GenerateHCCDocument()
}

Index ukDocNo On DocumentNo [ Data = DocumentNo, Unique ];

/// 根据文档类型校验是否所需章节完整
Method %OnValidateObject() As %Status [ Private, ServerOnly = 1 ]
{
    Set tOK = 1, tErrMsg=""
    //出院小结
    If ..DocumentType=53
    {
    }
    /// 住院病案首页
    Elseif ..DocumentType=32
    {
        Set:(..Diagnosis = "") tOK = 0
    }
    Quit $$$OK
}

/// 创建文档对象实例,转换为互联互通文档，并保存到文档仓库
Method CreateDocument(Output pDocument As %Stream.GlobalCharacter) As %Status
{
    Set tSC = $$$OK
    // generate XML stream from document object
    //Set tInput = ##class(%Stream.GlobalCharacter).%New()
    Set tInput = ""
    Set tSC = ..XMLExportToStream(.tInput)
    Quit:($$$ISERR(tSC)) tSC
    ;w tInput.Read(),!
    // transfer the document to HCC document
    Set tXSL = "C:\HCC\XSLT\C"_..DocumentType_".xsl"
    //Set tXSL = "C:\HCC\XSLT\C32.xsl"
    If $IsObject(tInput) 
    {
        Do tInput.Rewind()
        Set pDocument=##class(%Stream.GlobalCharacter).%New(),tParams="",tCompiledStyleSheet=""
        
        Set tSC=##class(%XML.XSLT.CompiledStyleSheet).CreateFromFile(tXSL,.tCompiledStyleSheet)
        If $$$ISERR(tSC) Quit
        
        Set tSC=##class(%XML.XSLT.Transformer).TransformStreamWithCompiledXSL(tInput,tCompiledStyleSheet,.pDocument,,.tParams)
        D ##class(HCC.Utils.Functions).toUTF8(.pDocument)
        Q:($$$ISERR(tSC)) tSC
    }
    // save document into document repository
    If $$$ISOK(tSC)
    {
        /*等Jeff在TRIP.GXWD.MODEL.GXWDDOC上增加唯一键后再开启此段code
        Set tDoc = ##class(TRIP.GXWD.MODEL.GXWDDOC).ukDocIdOpen(..DocumentNo)
        Set:($ISObject(tDoc)) tDoc = ##class(TRIP.GXWD.MODEL.GXWDDOC).%New()
        */
        Set tDoc = ##class(HCC.DocRepository.LatestDocs).%New()
        Set tDoc.DocId=..DocumentNo
        Set tDoc.DocName=..DocumentTypeLogicalToDisplay(..DocumentType)
        Set tDoc.Content=pDocument.Read()
        /// 发送系统标识
        Set tDoc.SenderId="HIP"
        /// 消息创建时间
        Set tDoc.MsgCreatTime = ""
        /// 文档生成日期时间
        Set tDoc.DocCreatTime=..LastUpdate
        Set tDoc.VersionNumber=..Version
        /// 患者唯一标识
        Set tDoc.PatId=..Header.RecordTarget.patientId.Value
        /// 身份证号
        Set tDoc.PatCardId=..Header.RecordTarget.patientId.Value
        /// 住院号标识
        Set tDoc.PatInHosCode=..Header.RecordTarget.MRN.Value
        /// 患者姓名
        Set tDoc.PatName=..Header.RecordTarget.patientName.Value
        /// 住院次数
        Set tDoc.PatInHosCount=""
        /// 门诊号标识
        Set tDoc.PatOutHosCode=..Header.RecordTarget.MRN.Value
        /// 患者就诊日期起始时间
        Set tDoc.PatEffectiveLowTime=..Header.EncompassingEncounter.effectiveTimeLow.Value
        /// 患者就诊日期截至时间
        Set tDoc.PatEffectiveHighTime=..Header.EncompassingEncounter.effectiveTimeHigh.Value
        /// 文档提供的医院标识
        Set tDoc.ProHosCode="Test"
        /// 文档提供的医院名称
        Set tDoc.ProHosName="Test"
        /// 科室代码
        Set tDoc.DeptCode="Test"
        /// 文档创建者编号
        Set tDoc.DocUserCode=..Header.Author.assignedPersonId
        /// 文档创建者姓名
        Set tDoc.DocUserName=..Header.Author.assignedPersonName
        /// 文档保管的医院标识
        Set tDoc.RepHosCode=..Header.Custodian.organizationId
        /// 文档保管的医院名称
        Set tDoc.RepHosName=..Header.Custodian.organizationName
        /// 数据存储时间
        Set tDoc.AddDate=$ZDATETIME($ZDATETIMEH($ZTS,-3),3,1,4)
        Set tSC = tDoc.%Save()
    }
    Quit tSC
}

ClassMethod Test()
{
    s x=##class(HCC.SQL.Document).%OpenId("Doc123456"),y=""
    w x.CreateDocument(.y),!
    w y.Read(),!
}

Storage Default
{
<Data name="DocumentDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>DocumentNo</Value>
</Value>
<Value name="3">
<Value>DocumentType</Value>
</Value>
<Value name="4">
<Value>LastUpdate</Value>
</Value>
<Value name="5">
<Value>NeedGenerate</Value>
</Value>
<Value name="6">
<Value>Activity</Value>
</Value>
<Value name="7">
<Value>RecordTarget</Value>
</Value>
<Value name="8">
<Value>author</Value>
</Value>
<Value name="9">
<Value>authenticator</Value>
</Value>
<Value name="10">
<Value>custodian</Value>
</Value>
<Value name="11">
<Value>participants</Value>
</Value>
<Value name="12">
<Value>relatedDocuments</Value>
</Value>
<Value name="13">
<Value>patient</Value>
</Value>
<Value name="14">
<Value>location</Value>
</Value>
<Value name="15">
<Value>VitalSign</Value>
</Value>
<Value name="16">
<Value>Diagnosis</Value>
</Value>
<Value name="17">
<Value>Problem</Value>
</Value>
<Value name="18">
<Value>Transfer</Value>
</Value>
<Value name="19">
<Value>DisDiag</Value>
</Value>
<Value name="20">
<Value>Allergy</Value>
</Value>
<Value name="21">
<Value>Lab</Value>
</Value>
<Value name="22">
<Value>Procedure</Value>
</Value>
<Value name="23">
<Value>Hospitalization</Value>
</Value>
<Value name="24">
<Value>HospitalProcess</Value>
</Value>
<Value name="25">
<Value>Administration</Value>
</Value>
<Value name="26">
<Value>CarePlan</Value>
</Value>
<Value name="27">
<Value>Fee</Value>
</Value>
<Value name="28">
<Value>HospitalizationProcess</Value>
</Value>
<Value name="29">
<Value>Payment</Value>
</Value>
<Value name="30">
<Value>Referral</Value>
</Value>
<Value name="31">
<Value>Allergies</Value>
</Value>
<Value name="32">
<Value>Header</Value>
</Value>
<Value name="33">
<Value>Version</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.DocumentD</DataLocation>
<DefaultData>DocumentDefaultData</DefaultData>
<IdLocation>^HCC.SQL.DocumentD</IdLocation>
<IndexLocation>^HCC.SQL.DocumentI</IndexLocation>
<StreamLocation>^HCC.SQL.DocumentS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
