/// Author: QP
/// Version: 1.0
/// Date:2021/07
/// 入院诊断 - 中医条目子表
Class HCC.SQL.Document.HospitalAdmissionDX.TCM Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

/// 中医病
Property diag As HCC.SQL.Document.TCMDiagItem [ SqlFieldName = diag ];

/// 中医证候
Property syndrome As HCC.SQL.Document.TCMDiagItem [ SqlFieldName = syndrome ];

/// 文档编号
Relationship HospitalAdmissionDX As HCC.SQL.Document.HospitalAdmissionDX [ Cardinality = parent, Inverse = TCMs, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="TCMDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>diag</Value>
</Value>
<Value name="3">
<Value>syndrome</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("TCMs")</DataLocation>
<DefaultData>TCMDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.HospitalAdmFB9AC("TCMs")</IdLocation>
<IndexLocation>^HCC.SQL.Document.HospiFBF2.TCMI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.HospiFBF2.TCMS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
