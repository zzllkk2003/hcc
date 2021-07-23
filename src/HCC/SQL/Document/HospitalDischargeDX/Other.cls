/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 出院诊断 - 其它诊断
Class HCC.SQL.Document.HospitalDischargeDX.Other Extends (%Persistent, %XML.Adaptor)
{

/// 其它诊断 - 疾病名称
Property diagnosisName As WS.DE.DE050102500 [ Required, SqlFieldName = diagnosis_name ];

/// 其它诊断 - 诊断疾病编码
Property diagnosisCode As WS.DE.DE050102400 [ Required, SqlFieldName = diagnosis_code ];

/// 确诊日期
Property effectiveTime As %TimeStamp [ Required, SqlFieldName = effectiveTime ];

/// 其它诊断入院病情代码
Property sickCondition As WS.DE.DE090010400 [ Required, SqlFieldName = sickCondition ];

Relationship HospitalDischargeDX As HCC.SQL.Document.HospitalDischargeDX [ Cardinality = parent, Inverse = Others, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="OtherDefaultData">
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
<DataLocation>^HCC.SQL.Document.HosC1CC.OtherD</DataLocation>
<DefaultData>OtherDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.HosC1CC.OtherD</IdLocation>
<IndexLocation>^HCC.SQL.Document.HosC1CC.OtherI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.HosC1CC.OtherS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
