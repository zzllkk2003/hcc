/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 出院诊断 - 主要诊断
Class HCC.SQL.Document.HospitalDischargeDX.Primary Extends (%Persistent, %XML.Adaptor)
{

/// 主要诊断 - 疾病名称
Property diagnosisName As WS.DE.DE050102500 [ Required, SqlFieldName = diagnosis_name ];

/// 主要诊断 - 疾病代码
Property diagnosisCode As WS.DE.DE050102400 [ Required, SqlFieldName = diagnosis_code ];

/// 确诊日期
Property effectiveTime As %TimeStamp [ Required, SqlFieldName = effectiveTime ];

/// 主要诊断入院病情代码
Property sickCondition As WS.DE.DE090010400 [ Required, SqlFieldName = sickCondition ];

Relationship HospitalDischargeDX As HCC.SQL.Document.HospitalDischargeDX [ Cardinality = parent, Inverse = Primarys, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="PrimaryDefaultData">
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
<Value>effectiveTime</Value>
</Value>
<Value name="5">
<Value>sickCondition</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.HC1CC.PrimaryD</DataLocation>
<DefaultData>PrimaryDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.HC1CC.PrimaryD</IdLocation>
<IndexLocation>^HCC.SQL.Document.HC1CC.PrimaryI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.HC1CC.PrimaryS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
