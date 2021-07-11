/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 治疗计划章节
Class HCC.SQL.Document.TreatmentPlan Extends (%Persistent, %XML.Adaptor)
{

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(ukDocNo);

/// 出院31天内再住院标志
Property readmission As WS.DE.DE060019400 [ SqlFieldName = readmission ];

/// 出院31天内再住院目的
Property readmissionReason As WS.DE.DE060019500 [ SqlFieldName = readmission_reason ];

Storage Default
{
<Data name="TreatmentPlanDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>readmission</Value>
</Value>
<Value name="3">
<Value>readmissionReason</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Docu70F6.TreatmentPlanD</DataLocation>
<DefaultData>TreatmentPlanDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Docu70F6.TreatmentPlanD</IdLocation>
<IndexLocation>^HCC.SQL.Docu70F6.TreatmentPlanI</IndexLocation>
<StreamLocation>^HCC.SQL.Docu70F6.TreatmentPlanS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
