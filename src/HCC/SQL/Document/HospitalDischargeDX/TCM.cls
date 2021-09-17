/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 出院中医诊断-主病子表
Class HCC.SQL.Document.HospitalDischargeDX.TCM Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

/// 中医病
Property TCMdiag As HCC.SQL.Document.TCMDiagItem [ SqlFieldName = TCMdiag ];

/// 中医入院病情
Property sickCondition As WS.DE.DE090010400 [ Required, SqlFieldName = sick_cond ];

/// 文档编号
Relationship HospitalDischargeDX As HCC.SQL.Document.HospitalDischargeDX [ Cardinality = parent, Inverse = TCM, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="TCMDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>diagnosisName</Value>
</Value>
<Value name="3">
<Value>diagnosisCode</Value>
</Value>
<Value name="4">
<Value>sickCondition</Value>
</Value>
<Value name="5">
<Value>TCMdiag</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("TCM")</DataLocation>
<DefaultData>TCMDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.HospitalDisC1A4C("TCM")</IdLocation>
<IndexLocation>^HCC.SQL.Document.HospiC1CC.TCMI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.HospiC1CC.TCMS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
