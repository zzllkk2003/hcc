/// Author: QP
/// Version: 1.0
/// Date:2021/07
/// 入院诊断 - 阳性辅助检查结果子表
Class HCC.SQL.Document.HospitalAdmissionDX.AuxExamResult Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

/// 阳性辅助检查结果
Property result As WS.DE.DE045012800 [ SqlFieldName = result ];

/// 文档编号
Relationship HospitalAdmissionDX As HCC.SQL.Document.HospitalAdmissionDX [ Cardinality = parent, Inverse = AuxExamResults, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="AuxExamResultDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>result</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("AuxExamResults")</DataLocation>
<DefaultData>AuxExamResultDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.HospitalAdmFB9AC("AuxExamResults")</IdLocation>
<IndexLocation>^HCC.SQL.DocuFBF2.AuxExamResultI</IndexLocation>
<StreamLocation>^HCC.SQL.DocuFBF2.AuxExamResultS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
