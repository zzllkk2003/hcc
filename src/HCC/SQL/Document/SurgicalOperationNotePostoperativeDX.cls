/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 术后诊断章节条目表
Class HCC.SQL.Document.SurgicalOperationNotePostoperativeDX Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode = "10218-6";

Parameter SectionName = "Surgical operation note postoperative Dx";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档号
Relationship DocumentNo As HCC.SQL.Document(XMLPROJECTION = "NONE") [ Cardinality = parent, Inverse = PostOpDiags ];

/// 疾病诊断
Property code As WS.DE.DE050102400 [ SqlFieldName = code ];

/// 诊断名称。用于《术后首次病程记录》
Property name As WS.DE.DE050102500 [ SqlFieldName = name ];

/// 诊断依据。用于《术后首次病程记录》
Property basis As WS.DE.DE050107000 [ SqlFieldName = basis ];

Storage Default
{
<Data name="SurgicalOperationNotePostoperativeDXDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>code</Value>
</Value>
<Value name="3">
<Value>name</Value>
</Value>
<Value name="4">
<Value>basis</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("SurgOperaNotePostoperaDXs")</DataLocation>
<DefaultData>SurgicalOperationNotePostoperativeDXDefaultData</DefaultData>
<IdLocation>^HCC.SQL.DocumentC("SurgOperaNotePostoperaDXs")</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.SurgicalOpeB842I</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.SurgicalOpeB842S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
