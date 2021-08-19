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
Property DocumentNo As %String [ Required ];

Index IdKey On DocumentNo [ IdKey, Unique ];

/// 文档类型。按WST500的编号和名称，逻辑值是1-53数字
Property DocumentType As %String(DISPLAYLIST = ",病历概要,门(急)诊病历,急诊留观病历,西药处方,中药处方,检查报告,检验报告,治疗记录,一般手术记录,麻醉术前访视记录,麻醉记录,麻醉术后访视记录,输血记录,待产记录,阴道分娩记录,剖宫产记录,一般护理记录,病重(病危)护理记录,手术护理记录,生命体征测量记录,出入量记录,高值耗材使用记录,入院评估,护理计划,出院评估与指导,手术知情同意书,麻醉知情同意书,输血治疗同意书,特殊检查与特殊治疗同意书,病危(重)通知书,其它知情同意书,住院病案首页,中医住院病案首页,入院记录,24小时内入出院记录,25小时内入院死亡记录,住院病程记录 首次病程记录,住院病程记录 日常病程记录,住院病程记录 上级医师查房记录,住院病程记录 疑难病例讨论记录,住院病程记录 交接班记录,住院病程记录 转科记录,住院病程记录 阶段小结,住院病程记录 抢救记录,住院病程记录 会诊记录,住院病程记录 术前小结,住院病程记录 术前讨论,住院病程记录 术后首次病程记录,住院病程记录 出院记录,住院病程记录 死亡记录,住院病程记录 死亡病例讨论记录,住院医嘱,出院小结", VALUELIST = ",1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53") [ Required ];

/// 批号，在批量导入数据时使用，要于标记批次。后续可以根据批次号进行整批操作，例如整批删除
Property BatchNo As %String;

/// 最后一次更新
Property LastUpdate As %TimeStamp [ InitialExpression = {$ZDATETIME($ZDATETIMEH($ZTS,-3),3,1,4)} ];

/// 文档版本
Property Version As %Integer [ InitialExpression = 1 ];

/// 是否需要更新整个文档
Property NeedGenerate As %Boolean(XMLPROJECTION = "NONE") [ InitialExpression = 0 ];

/// 文档头
Property Header As HCC.SQL.Document.Header;

/// 既往史章节
Property PastHistory As HCC.SQL.Document.PastHistory;

/// 月经史章节
Property Menstrual As HCC.SQL.Document.MenstrualHistory;

/// 过敏史章节
Property Allergy As HCC.SQL.Document.Allergy;

/// 住院史章节
Property Hospitalization As HCC.SQL.Document.Hospitalization;

/// 住院过程章节
Property HospitalCourse As HCC.SQL.Document.HospitalCourse;

/// 《检查报告》的体格检查章节
Property ERPhysicalExam As HCC.SQL.Document.ExamReportPhysicalExam;

/// 诊断记录章节
Property Diagnosis As HCC.SQL.Document.Diagnosis;

/// 主要健康问题章节
Property Problem As HCC.SQL.Document.HealthProblem;

/// 转科记录章节
Property Referral As HCC.SQL.Document.Referral;

/// 出院诊断章节
Property DisDiag As HCC.SQL.Document.HospitalDischargeDX;

/// 入院诊断章节
Property AdmDiag As HCC.SQL.Document.HospitalAdmissionDX;

/// 术前诊断章节
Property PreOpDiag As HCC.SQL.Document.SurgicalOperationNotePreoperativeDX;

/// 实验室检查章节
Property LabTest As HCC.SQL.Document.LabTest;

/// 医嘱章节
Property ProviderOrder As HCC.SQL.Document.ProviderOrder;

/// 手术操作章节
Property Procedure As HCC.SQL.Document.Procedure;

/// 手术过程描述章节
Property ProcedureNote As HCC.SQL.Document.ProcedureNote;

/// 宫剖产手术操作章节
Property CaesareanProcedure As HCC.SQL.Document.CaesareanProcedure;

/// 引流章节
Property SurgicalDrains As HCC.SQL.Document.SurgicalDrains;

/// 用药史章节
Property MedicationUseHistory As HCC.SQL.Document.MedicationUseHistory;

/// 行政管理章节
Property Administration As HCC.SQL.Document.Administration;

/// 治疗计划章节
Property TreatmentPlan As HCC.SQL.Document.TreatmentPlan;

/// 费用章节
Property Payment As HCC.SQL.Document.Payment;

/// 卫生事件章节
Property HealthcareEvent As HCC.SQL.Document.HealthcareEvent;

/// 主诉章节
Property ChiefComplaint As HCC.SQL.Document.ChiefComplaint;

/// 现病史章节
Property PresentIllnessHistory As HCC.SQL.Document.PresentIllnessHistory;

/// 社会史/个人史章节条目
Property SocialHistory As HCC.SQL.Document.SocialHistory;

/// 抢救记录章节
Property RescueRecord As HCC.SQL.Document.RescueRecord;

/// 其他相关信息章节
Property Other As HCC.SQL.Document.Other;

/// 其他处置章节
Property OtherProc As HCC.SQL.Document.OtherProc;

/// 检查报告章节
Property CheckReport As HCC.SQL.Document.CheckReport;

/// 检验报告章节
Property LabReport As HCC.SQL.Document.LabReport;

/// 失血章节
Property BloodLoss As HCC.SQL.Document.BloodLoss;

/// 输血章节。注意，它与既往史中的输血史不同
Property BloodTransfusion As HCC.SQL.Document.BloodTransfusion;

/// 输液章节
Property Infusion As HCC.SQL.Document.Infusion;

/// 术后去向章节
Property ProcedureDisposition As HCC.SQL.Document.ProcedureDisposition;

/// 一般状况检查章节
Property GeneralStatus As HCC.SQL.Document.GeneralStatus;

/// 产前检查章节
Property PrenatalEvent As HCC.SQL.Document.PrenatalEvent;

/// 阴道分娩章节
Property VaginalDelivery As HCC.SQL.Document.VaginalDelivery;

/// 产后处置章节
Property ProcessPostDelivery As HCC.SQL.Document.ProcessPostDelivery;

/// 新生儿章节
Property NewBorn As HCC.SQL.Document.NewBorn;

/// 分娩评估章节
Property DeliveryAssessment As HCC.SQL.Document.DeliveryAssessment;

/// 四肢章节
Property Extremities As HCC.SQL.Document.Extremities;

/// 皮肤章节
Property Skin As HCC.SQL.Document.Skin;

/// 健康指导章节
Property HealthGuidance As HCC.SQL.Document.HealthGuidance;

/// 护理记录章节
Property NursingRecord As HCC.SQL.Document.NursingRecord;

/// 护理标志章节
Property NursingSign As HCC.SQL.Document.NursingSign;

/// 手术评估标志章节
Property ProcedureAssessment As HCC.SQL.Document.ProcedureAssessment;

/// 护理隔离章节
Property NursingIsolation As HCC.SQL.Document.NursingIsolation;

/// 器械物品核对章节
Property InstrumentVerification As HCC.SQL.Document.InstrumentVerification;

/// 住院过程章节-术后交接
Property PostoperationHandover As HCC.SQL.Document.PostoperationHandover;

/// 入院信息章节
Property AdmissionInformation As HCC.SQL.Document.AdmissionInformation;

/// 健康评估章节
Property HealthAssessment As HCC.SQL.Document.HealthAssessment;

/// 生活方式章节
Property LifeStyle As HCC.SQL.Document.LifeStyle;

/// 风险章节
Property Risk As HCC.SQL.Document.Risk;

/// 意见章节
Property Suggestion As HCC.SQL.Document.Suggestion;

/// 知情同意章节
Property Consent As HCC.SQL.Document.Consent;

/// 会诊原因章节
Property ConsultReason As HCC.SQL.Document.ConsultReason;

/// 会诊意见章节
Property ConsultSuggestion As HCC.SQL.Document.ConsultSuggestion;

/// 病历摘要章节
Property MRSummary As HCC.SQL.Document.MRSummary;

/// 注意事项章节
Property Attention As HCC.SQL.Document.Attention;

/// 术前总结章节
Property PreoperativeSummary As HCC.SQL.Document.PreoperativeSummary;

/// 死亡原因章节
Property DeathReason As HCC.SQL.Document.DeathReason;

/// 尸检意见章节
Property AutopsyOpinion As HCC.SQL.Document.AutopsyOpinion;

/// 讨论内容章节
Property Discussion As HCC.SQL.Document.Discussion;

/// 讨论总结章节
Property DiscussionSummary As HCC.SQL.Document.DiscussionSummary;

/// 高值耗材章节-条目
Relationship HighValueConsumables As HCC.SQL.Document.HighValueConsumable [ Cardinality = children, Inverse = DocumentNo ];

/// 护理观察章节条目
Relationship NursingObservations As HCC.SQL.Document.NursingObservation [ Cardinality = children, Inverse = DocumentNo ];

/// 症状章节条目
Relationship Symptoms As HCC.SQL.Document.Symptom [ Cardinality = children, Inverse = DocumentNo ];

/// 用药管理章节条目
Relationship MedicationAdministereds As HCC.SQL.Document.MedicationAdministered [ Cardinality = children, Inverse = DocumentNo ];

/// 体格检查章节条目
Relationship PhysicalExams As HCC.SQL.Document.PhysicalExam [ Cardinality = children, Inverse = DocumentNo ];

/// 家族史章节条目
Relationship FamilyHistories As HCC.SQL.Document.FamilyHistory [ Cardinality = children, Inverse = DocumentNo ];

/// 生命体征章节条目
Relationship VitalSigns As HCC.SQL.Document.VitalSign [ Cardinality = children, Inverse = DocumentNo ];

/// 预防接种史章节条目
Relationship Vaccinations As HCC.SQL.Document.Vaccination [ Cardinality = children, Inverse = DocumentNo ];

/// 护理操作章节条目
Relationship NursingOperations As HCC.SQL.Document.NursingOperation [ Cardinality = children, Inverse = DocumentNo ];

/// 辅助检查章节-条目
Relationship SupplementaryExams As HCC.SQL.Document.SupplementaryExam [ Cardinality = children, Inverse = DocumentNo ];

/// 术后诊断章节
Relationship PostOpDiags As HCC.SQL.Document.SurgicalOperationNotePostoperativeDX [ Cardinality = children, Inverse = DocumentNo ];

/// 麻醉章节 - 条目
Relationship Anesthesias As HCC.SQL.Document.Anesthesia [ Cardinality = children, Inverse = DocumentNo ];

/// 清除所有章节-非关系型章节
Method ClearSections()
{
    Set ..AdmDiag=""
    Set ..Administration=""
    Set ..AdmissionInformation=""
    Set ..Allergy=""
    Set ..Attention=""
    Set ..AutopsyOpinion=""
    Set ..BloodLoss=""
    Set ..BloodTransfusion=""
    Set ..CaesareanProcedure=""
    Set ..CheckReport=""
    Set ..ChiefComplaint=""
    Set ..Consent=""
    Set ..ConsultReason=""
    Set ..ConsultSuggestion=""
    Set ..DeathReason=""
    Set ..DeliveryAssessment=""
    Set ..Diagnosis=""
    Set ..DisDiag=""
    Set ..Discussion=""
    Set ..DiscussionSummary=""
    Set ..Extremities=""
    Set ..GeneralStatus=""
    Set ..Header=""
    Set ..HealthAssessment=""
    Set ..HealthGuidance=""
    Set ..HealthcareEvent=""
    Set ..HospitalCourse=""
    Set ..Hospitalization=""
    Set ..Infusion=""
    Set ..InstrumentVerification=""
    Set ..LabReport=""
    Set ..LabTest=""
    Set ..LifeStyle=""
    Set ..MRSummary=""
    Set ..MedicationUseHistory=""
    Set ..Menstrual=""
    Set ..NewBorn=""
    Set ..NursingIsolation=""
    Set ..NursingRecord=""
    Set ..NursingSign=""
    Set ..Other=""
    Set ..OtherProc=""
    Set ..PastHistory=""
    Set ..Payment=""
    Set ..PostoperationHandover=""
    Set ..PreOpDiag=""
    Set ..PrenatalEvent=""
    Set ..PreoperativeSummary=""
    Set ..PresentIllnessHistory=""
    Set ..Problem=""
    Set ..Procedure=""
    Set ..ProcedureAssessment=""
    Set ..ProcedureDisposition=""
    Set ..ProcedureNote=""
    Set ..ProcessPostDelivery=""
    Set ..ProviderOrder=""
    Set ..Referral=""
    Set ..RescueRecord=""
    Set ..Risk=""
    Set ..Skin=""
    Set ..Suggestion=""
    Set ..SurgicalDrains=""
    Set ..TreatmentPlan=""
    Set ..VaginalDelivery=""
}

Method SetHeader(pDocNo)
{
    Set ..Header=##class(HCC.SQL.Document.Header).%OpenId(pDocNo)
}

/// 既往史章节
Method SetPastHistory(pDocNo)
{
    Set ..PastHistory=##Class(HCC.SQL.Document.PastHistory).%OpenId(pDocNo)
}

/// 月经史章节
Method SetMenstrual(pDocNo)
{
    Set ..Menstrual=##Class(HCC.SQL.Document.MenstrualHistory).%OpenId(pDocNo)
}

/// 个人史/社会史章节
Method SetSocialHistory(pDocNo)
{
    Set ..SocialHistory=##Class(HCC.SQL.Document.SocialHistory).%OpenId(pDocNo)
}

/// 过敏史章节
Method SetAllergy(pDocNo)
{
    Set ..Allergy=##Class(HCC.SQL.Document.Allergy).%OpenId(pDocNo)
}

/// 注意事项章节
Method SetAttention(pDocNo)
{
    Set ..Attention=##Class(HCC.SQL.Document.Attention).%OpenId(pDocNo)
}

/// 住院史章节
Method SetHospitalization(pDocNo)
{
    Set ..Hospitalization=##Class(HCC.SQL.Document.Hospitalization).%OpenId(pDocNo)
}

/// 住院过程节
Method SetHospitalCourse(pDocNo)
{
    Set ..HospitalCourse=##Class(HCC.SQL.Document.HospitalCourse).%OpenId(pDocNo)
}

/// 诊断记录章节
Method SetExamReportPhysicalExam(pDocNo)
{
    Set ..ERPhysicalExam=##Class(HCC.SQL.Document.ExamReportPhysicalExam).%OpenId(pDocNo)
}

/// 诊断记录章节
Method SetDiagnosis(pDocNo)
{
    Set ..Diagnosis=##Class(HCC.SQL.Document.Diagnosis).%OpenId(pDocNo)
}

/// 主要健康问题章节
Method SetProblem(pDocNo)
{
    Set ..Problem=##Class(HCC.SQL.Document.HealthProblem).%OpenId(pDocNo)
}

/// 转科记录章节
Method SetReferral(pDocNo)
{
    Set ..Referral=##Class(HCC.SQL.Document.Referral).%OpenId(pDocNo)
}

/// 出院诊断章节
Method SetDisDiag(pDocNo)
{
    Set ..DisDiag=##Class(HCC.SQL.Document.HospitalDischargeDX).%OpenId(pDocNo)
}

/// 入院诊断章节
Method SetAdmDiag(pDocNo)
{
    Set ..AdmDiag=##Class(HCC.SQL.Document.HospitalAdmissionDX).%OpenId(pDocNo)
}

/// 术前诊断章节
Method SetPreOpDiag(pDocNo)
{
    Set ..PreOpDiag=##Class(HCC.SQL.Document.SurgicalOperationNotePreoperativeDX).%OpenId(pDocNo)
}

/// 实验室检查章节
Method SetLabTest(pDocNo)
{
    Set ..LabTest=##Class(HCC.SQL.Document.LabTest).%OpenId(pDocNo)
}

/// 医嘱章节
Method SetProviderOrder(pDocNo)
{
    Set ..ProviderOrder=##Class(HCC.SQL.Document.ProviderOrder).%OpenId(pDocNo)
}

/// 手术操作章节
Method SetProcedure(pDocNo)
{
    Set ..Procedure=##Class(HCC.SQL.Document.Procedure).%OpenId(pDocNo)
}

/// 手术过程描述章节
Method SetProcedureNote(pDocNo)
{
    Set ..ProcedureNote=##Class(HCC.SQL.Document.ProcedureNote).%OpenId(pDocNo)
}

/// 宫剖产手术操作章节
Method SetCaesareanProcedure(pDocNo)
{
    Set ..CaesareanProcedure=##Class(HCC.SQL.Document.CaesareanProcedure).%OpenId(pDocNo)
}

/// 引流章节
Method SetSurgicalDrains(pDocNo)
{
    Set ..SurgicalDrains=##Class(HCC.SQL.Document.SurgicalDrains).%OpenId(pDocNo)
}

/// 用药史章节
Method SetMedicationUseHistory(pDocNo)
{
    Set ..MedicationUseHistory=##Class(HCC.SQL.Document.MedicationUseHistory).%OpenId(pDocNo)
}

/// 行政管理章节
Method SetAdministration(pDocNo)
{
    Set ..Administration=##Class(HCC.SQL.Document.Administration).%OpenId(pDocNo)
}

/// 治疗计划章节
Method SetTreatmentPlan(pDocNo)
{
    Set ..TreatmentPlan=##Class(HCC.SQL.Document.TreatmentPlan).%OpenId(pDocNo)
}

/// 费用章节
Method SetPayment(pDocNo)
{
    Set ..Payment=##Class(HCC.SQL.Document.Payment).%OpenId(pDocNo)
}

/// 卫生事件章节
Method SetHealthcareEvent(pDocNo)
{
    Set ..HealthcareEvent=##Class(HCC.SQL.Document.HealthcareEvent).%OpenId(pDocNo)
}

/// 主诉章节
Method SetChiefComplaint(pDocNo)
{
    Set ..ChiefComplaint=##Class(HCC.SQL.Document.ChiefComplaint).%OpenId(pDocNo)
}

/// 现病史章节
Method SetPresentIllnessHistory(pDocNo)
{
    Set ..PresentIllnessHistory=##Class(HCC.SQL.Document.PresentIllnessHistory).%OpenId(pDocNo)
}

/// 抢救记录章节
Method SetRescueRecord(pDocNo)
{
    Set ..RescueRecord=##Class(HCC.SQL.Document.RescueRecord).%OpenId(pDocNo)
}

/// 其他相关信息章节
Method SetOther(pDocNo)
{
    Set ..Other=##Class(HCC.SQL.Document.Other).%OpenId(pDocNo)
}

/// 其他处置章节
Method SetOtherProc(pDocNo)
{
    Set ..OtherProc=##Class(HCC.SQL.Document.OtherProc).%OpenId(pDocNo)
}

/// 检查报告章节
Method SetCheckReport(pDocNo)
{
    Set ..CheckReport=##Class(HCC.SQL.Document.CheckReport).%OpenId(pDocNo)
}

/// 讨论内容章节
Method SetDiscussion(pDocNo)
{
    Set ..Discussion=##Class(HCC.SQL.Document.Discussion).%OpenId(pDocNo)
}

/// 讨论总结章节
Method SetDiscussionSummary(pDocNo)
{
    Set ..DiscussionSummary=##Class(HCC.SQL.Document.DiscussionSummary).%OpenId(pDocNo)
}

/// 检验报告章节
Method SetLabReport(pDocNo)
{
    Set ..LabReport=##Class(HCC.SQL.Document.LabReport).%OpenId(pDocNo)
}

/// 失血章节
Method SetBloodLoss(pDocNo)
{
    Set ..BloodLoss=##Class(HCC.SQL.Document.BloodLoss).%OpenId(pDocNo)
}

/// 输血章节。注意，它与既往史中的输血史不同
Method SetBloodTransfusion(pDocNo)
{
    Set ..BloodTransfusion=##Class(HCC.SQL.Document.BloodTransfusion).%OpenId(pDocNo)
}

/// 输液章节
Method SetInfusion(pDocNo)
{
    Set ..Infusion=##Class(HCC.SQL.Document.Infusion).%OpenId(pDocNo)
}

/// 术后去向章节
Method SetProcedureDisposition(pDocNo)
{
    Set ..ProcedureDisposition=##Class(HCC.SQL.Document.ProcedureDisposition).%OpenId(pDocNo)
}

/// 一般状况检查章节
Method SetGeneralStatus(pDocNo)
{
    Set ..GeneralStatus=##Class(HCC.SQL.Document.GeneralStatus).%OpenId(pDocNo)
}

/// 产前检查章节
Method SetPrenatalEvent(pDocNo)
{
    Set ..PrenatalEvent=##Class(HCC.SQL.Document.PrenatalEvent).%OpenId(pDocNo)
}

/// 阴道分娩章节
Method SetVaginalDelivery(pDocNo)
{
    Set ..VaginalDelivery=##Class(HCC.SQL.Document.VaginalDelivery).%OpenId(pDocNo)
}

/// 产后处置章节
Method SetProcessPostDelivery(pDocNo)
{
    Set ..ProcessPostDelivery=##Class(HCC.SQL.Document.ProcessPostDelivery).%OpenId(pDocNo)
}

/// 新生儿章节
Method SetNewBorn(pDocNo)
{
    Set ..NewBorn=##Class(HCC.SQL.Document.NewBorn).%OpenId(pDocNo)
}

/// 尸检意见章节
Method SetAutopsyOpinion(pDocNo)
{
    Set ..AutopsyOpinion=##Class(HCC.SQL.Document.AutopsyOpinion).%OpenId(pDocNo)
}

/// 死亡原因章节
Method SetDeathReason(pDocNo)
{
    Set ..DeathReason=##Class(HCC.SQL.Document.DeathReason).%OpenId(pDocNo)
}

/// 分娩评估章节
Method SetDeliveryAssessment(pDocNo)
{
    Set ..DeliveryAssessment=##Class(HCC.SQL.Document.DeliveryAssessment).%OpenId(pDocNo)
}

/// 四肢章节
Method SetExtremities(pDocNo)
{
    Set ..Extremities=##Class(HCC.SQL.Document.Extremities).%OpenId(pDocNo)
}

/// 皮肤章节
Method SetSkin(pDocNo)
{
    Set ..Skin=##Class(HCC.SQL.Document.Skin).%OpenId(pDocNo)
}

/// 健康指导章节
Method SetHealthGuidance(pDocNo)
{
    Set ..HealthGuidance=##Class(HCC.SQL.Document.HealthGuidance).%OpenId(pDocNo)
}

/// 护理记录章节
Method SetNursingRecord(pDocNo)
{
    Set ..NursingRecord=##Class(HCC.SQL.Document.NursingRecord).%OpenId(pDocNo)
}

/// 护理标志章节
Method SetNursingSign(pDocNo)
{
    Set ..NursingSign=##Class(HCC.SQL.Document.NursingSign).%OpenId(pDocNo)
}

/// 手术评估标志章节
Method SetProcedureAssessment(pDocNo)
{
    Set ..ProcedureAssessment=##Class(HCC.SQL.Document.ProcedureAssessment).%OpenId(pDocNo)
}

/// 护理隔离章节
Method SetNursingIsolation(pDocNo)
{
    Set ..NursingIsolation=##Class(HCC.SQL.Document.NursingIsolation).%OpenId(pDocNo)
}

/// 器械物品核对章节
Method SetInstrumentVerification(pDocNo)
{
    Set ..InstrumentVerification=##Class(HCC.SQL.Document.InstrumentVerification).%OpenId(pDocNo)
}

/// 住院过程章节-术后交接
Method SetPostoperationHandover(pDocNo)
{
    Set ..PostoperationHandover=##Class(HCC.SQL.Document.PostoperationHandover).%OpenId(pDocNo)
}

/// 入院信息章节
Method SetAdmissionInformation(pDocNo)
{
    Set ..AdmissionInformation=##Class(HCC.SQL.Document.AdmissionInformation).%OpenId(pDocNo)
}

/// 健康评估章节
Method SetHealthAssessment(pDocNo)
{
    Set ..HealthAssessment=##Class(HCC.SQL.Document.HealthAssessment).%OpenId(pDocNo)
}

/// 生活方式章节
Method SetLifeStyle(pDocNo)
{
    Set ..LifeStyle=##Class(HCC.SQL.Document.LifeStyle).%OpenId(pDocNo)
}

/// 风险章节
Method SetRisk(pDocNo)
{
    Set ..Risk=##Class(HCC.SQL.Document.Risk).%OpenId(pDocNo)
}

/// 意见章节
Method SetSuggestion(pDocNo)
{
    Set ..Suggestion=##Class(HCC.SQL.Document.Suggestion).%OpenId(pDocNo)
}

/// 知情同意章节
Method SetConsent(pDocNo)
{
    Set ..Consent=##Class(HCC.SQL.Document.Consent).%OpenId(pDocNo)
}

/// 会诊原因章节
Method SetConsultReason(pDocNo)
{
    Set ..ConsultReason=##Class(HCC.SQL.Document.ConsultReason).%OpenId(pDocNo)
}

/// 会诊意见章节
Method SetConsultSuggestion(pDocNo)
{
    Set ..ConsultSuggestion=##Class(HCC.SQL.Document.ConsultSuggestion).%OpenId(pDocNo)
}

/// 病历摘要章节
Method SetMRSummary(pDocNo)
{
    Set ..MRSummary=##Class(HCC.SQL.Document.MRSummary).%OpenId(pDocNo)
}

/// 术前总结章节
Method SetPreoperativeSummary(pDocNo)
{
    Set ..PreoperativeSummary=##Class(HCC.SQL.Document.PreoperativeSummary).%OpenId(pDocNo)
}

/// SQL更新后, 触发互联互通文档生成
/// 它只是将文档号压栈到文档产生队列中，由后台任务产生文档
Trigger GenerateHCCDocumentUpdate [ Event = UPDATE, Time = AFTER ]
{
    //如果NeedGenerate字段由0变1,触发文档生成
    if {NeedGenerate*C} && ({NeedGenerate}=1)
    {
        Set ^QPTestLog($I(^QPTestLog),"NeedGenerateTrigger")=1
        Set tDocNum={DocumentNo}
        Do ##class(HCC.Util).PushDocGenQueue(tDocNum)
    }
}

/// 根据文档类型校验是否所需章节完整
Method %OnValidateObject() As %Status [ Private, ServerOnly = 1 ]
{
    Quit $$$OK
}

/// 产生文档信息JSON字符串
/// pDocInfo：文档信息JSON字符串
Method GenDocInfo(ByRef pDocInfo As %String) As %Status
{
    Set tRet = $$$OK
    try
    {
        Set tDocInfo=##class(%DynamicObject).%New()
        /// 文档类型代码
        Set tDocInfo.DocType = ..DocumentType
        /// 文档类型名称
        Set tDocInfo.DocName = ..DocumentTypeLogicalToDisplay(..DocumentType)
        /// 文档流水号 文档唯一标识
        Set tDocInfo.DocNum= ..DocumentNo
        /// 文档生成日期时间
        Set tDocInfo.DocCreatTime = ..LastUpdate
        /// 文档版本号
        Set tDocInfo.DocVersion = ..Version
        /// 患者身份证号
        Set tDocInfo.PatientIDNo=..Header.recordTarget.patient.patientId.Value
        // 门急诊号
        //Set tDocInfo.OutPatientNum=..Header.recordTarget.inpatientNum
        /// 住院号标识
        Set tDocInfo.InPatientNum=..Header.recordTarget.inpatientNum.Value
        /// 患者就诊日期起始时间 20170101
        Set tDocInfo.EncBeginTime = ..Header.encompassingEncounter.effectiveTimeLow.Value
        /// 患者就诊日期截至时间  
        Set tDocInfo.EncEndTime = ..Header.encompassingEncounter.effectiveTimeHigh.Value
        /*/// 文档提供的医院标识
        Set tDocInfo.HospitalID = ..Header.encompassingEncounter.Locations.
        /// 文档提供的医院名称
        Set tDocInfo.HospitalName
        /// 科室代码
        Set tDocInfo.DeptCode*/
        /// 文档创建者编号
        Set tDocInfo.AuthorID = ..Header.author.authorId
        /// 文档创建者姓名
        Set tDocInfo.AuthorName = ..Header.author.assignedPersonName.Value
        /// 文档保管的医院标识                    
        Set tDocInfo.CustodianCode = ..Header.custodian.organizationId
        /// 文档保管的医院名称
        Set tDocInfo.CustodianName = ..Header.custodian.organizationName
        Set pDocInfo = tDocInfo.%ToJSON()
        Return tRet
    }
    catch(e)
    {
        Return e
    }
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
<Value>DocumentType</Value>
</Value>
<Value name="3">
<Value>BatchNo</Value>
</Value>
<Value name="4">
<Value>LastUpdate</Value>
</Value>
<Value name="5">
<Value>Version</Value>
</Value>
<Value name="6">
<Value>NeedGenerate</Value>
</Value>
<Value name="7">
<Value>Header</Value>
</Value>
<Value name="8">
<Value>PastHistory</Value>
</Value>
<Value name="9">
<Value>Menstrual</Value>
</Value>
<Value name="10">
<Value>Allergy</Value>
</Value>
<Value name="11">
<Value>Hospitalization</Value>
</Value>
<Value name="12">
<Value>HospitalCourse</Value>
</Value>
<Value name="13">
<Value>ERPhysicalExam</Value>
</Value>
<Value name="14">
<Value>Diagnosis</Value>
</Value>
<Value name="15">
<Value>Problem</Value>
</Value>
<Value name="16">
<Value>Referral</Value>
</Value>
<Value name="17">
<Value>DisDiag</Value>
</Value>
<Value name="18">
<Value>AdmDiag</Value>
</Value>
<Value name="19">
<Value>PreOpDiag</Value>
</Value>
<Value name="20">
<Value>LabTest</Value>
</Value>
<Value name="21">
<Value>ProviderOrder</Value>
</Value>
<Value name="22">
<Value>Procedure</Value>
</Value>
<Value name="23">
<Value>ProcedureNote</Value>
</Value>
<Value name="24">
<Value>CaesareanProcedure</Value>
</Value>
<Value name="25">
<Value>SurgicalDrains</Value>
</Value>
<Value name="26">
<Value>MedicationUseHistory</Value>
</Value>
<Value name="27">
<Value>Administration</Value>
</Value>
<Value name="28">
<Value>TreatmentPlan</Value>
</Value>
<Value name="29">
<Value>Payment</Value>
</Value>
<Value name="30">
<Value>HealthcareEvent</Value>
</Value>
<Value name="31">
<Value>ChiefComplaint</Value>
</Value>
<Value name="32">
<Value>PresentIllnessHistory</Value>
</Value>
<Value name="33">
<Value>SocialHistory</Value>
</Value>
<Value name="34">
<Value>RescueRecord</Value>
</Value>
<Value name="35">
<Value>Other</Value>
</Value>
<Value name="36">
<Value>OtherProc</Value>
</Value>
<Value name="37">
<Value>CheckReport</Value>
</Value>
<Value name="38">
<Value>LabReport</Value>
</Value>
<Value name="39">
<Value>BloodLoss</Value>
</Value>
<Value name="40">
<Value>BloodTransfusion</Value>
</Value>
<Value name="41">
<Value>Infusion</Value>
</Value>
<Value name="42">
<Value>ProcedureDisposition</Value>
</Value>
<Value name="43">
<Value>GeneralStatus</Value>
</Value>
<Value name="44">
<Value>PrenatalEvent</Value>
</Value>
<Value name="45">
<Value>VaginalDelivery</Value>
</Value>
<Value name="46">
<Value>ProcessPostDelivery</Value>
</Value>
<Value name="47">
<Value>NewBorn</Value>
</Value>
<Value name="48">
<Value>DeliveryAssessment</Value>
</Value>
<Value name="49">
<Value>Extremities</Value>
</Value>
<Value name="50">
<Value>Skin</Value>
</Value>
<Value name="51">
<Value>HealthGuidance</Value>
</Value>
<Value name="52">
<Value>NursingRecord</Value>
</Value>
<Value name="53">
<Value>NursingSign</Value>
</Value>
<Value name="54">
<Value>ProcedureAssessment</Value>
</Value>
<Value name="55">
<Value>NursingIsolation</Value>
</Value>
<Value name="56">
<Value>InstrumentVerification</Value>
</Value>
<Value name="57">
<Value>PostoperationHandover</Value>
</Value>
<Value name="58">
<Value>AdmissionInformation</Value>
</Value>
<Value name="59">
<Value>HealthAssessment</Value>
</Value>
<Value name="60">
<Value>LifeStyle</Value>
</Value>
<Value name="61">
<Value>Risk</Value>
</Value>
<Value name="62">
<Value>Suggestion</Value>
</Value>
<Value name="63">
<Value>Consent</Value>
</Value>
<Value name="64">
<Value>ConsultReason</Value>
</Value>
<Value name="65">
<Value>ConsultSuggestion</Value>
</Value>
<Value name="66">
<Value>MRSummary</Value>
</Value>
<Value name="67">
<Value>Attention</Value>
</Value>
<Value name="68">
<Value>PreoperativeSummary</Value>
</Value>
<Value name="69">
<Value>DeathReason</Value>
</Value>
<Value name="70">
<Value>AutopsyOpinion</Value>
</Value>
<Value name="71">
<Value>Discussion</Value>
</Value>
<Value name="72">
<Value>DiscussionSummary</Value>
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
