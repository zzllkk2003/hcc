/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 出院诊断 - 其它诊断子表
Class HCC.SQL.Document.HospitalDischargeDX.Other Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

/// 其它诊断 
Property diag As HCC.SQL.Document.DiagnosisItem [ SqlFieldName = diag ];

/// 其它诊断入院病情代码
Property sickCondition As WS.DE.DE090010400 [ SqlFieldName = sick_cond ];

/// 文档编号
Relationship HospitalDischargeDX As HCC.SQL.Document.HospitalDischargeDX [ Cardinality = parent, Inverse = Others, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="OtherDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>diag</Value>
</Value>
<Value name="3">
<Value>sickCondition</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Others")</DataLocation>
<DefaultData>OtherDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.HospitalDisC1A4C("Others")</IdLocation>
<IndexLocation>^HCC.SQL.Document.HosC1CC.OtherI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.HosC1CC.OtherS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
