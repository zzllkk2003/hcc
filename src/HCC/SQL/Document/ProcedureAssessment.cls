/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 手术评估记录标志章节表
Class HCC.SQL.Document.ProcedureAssessment Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode;

Parameter SectionName = "手术评估标志";

Parameter SectionCodeSystemOID;

Parameter SectionCodeSystem;

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 发出手术安全核对表标志                                                             
Property sendSaftyForm As WS.DE.DE060020400 [ SqlFieldName = send_safty_form ];

/// 收回手术安全核对表标志                                                             
Property collectSaftyForm As WS.DE.DE060033800 [ SqlFieldName = collect_safty_form ];

/// 发出手术风险评估表标志                                                             
Property sendRiskForm As WS.DE.DE060020400 [ SqlFieldName = send_risk_form ];

/// 收回手术风险评估表标志                                                             
Property collectRiskForm As WS.DE.DE060033800 [ SqlFieldName = collect_risk_form ];

Storage Default
{
<Data name="ProcedureAssessmentDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>sendSaftyForm</Value>
</Value>
<Value name="3">
<Value>collectSaftyForm</Value>
</Value>
<Value name="4">
<Value>sendRiskForm</Value>
</Value>
<Value name="5">
<Value>collectRiskForm</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.ProcedureAsBC45D</DataLocation>
<DefaultData>ProcedureAssessmentDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.ProcedureAsBC45D</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.ProcedureAsBC45I</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.ProcedureAsBC45S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
