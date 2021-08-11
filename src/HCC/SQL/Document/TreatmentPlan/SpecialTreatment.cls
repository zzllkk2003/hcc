/// 治疗计划章节 - 特殊检查及特殊治疗项目
Class HCC.SQL.Document.TreatmentPlan.SpecialTreatment Extends (%SerialObject, %XML.Adaptor)
{

/// 特殊检查及特殊治疗项目名称
Property name As WS.DE.DE060030600 [ SqlFieldName = name ];

/// 特殊检查及特殊治疗目的
Property reason As WS.DE.DE060030500 [ SqlFieldName = reason ];

Storage Default
{
<Data name="SpecialTreatmentState">
<Value name="1">
<Value>name</Value>
</Value>
<Value name="2">
<Value>reason</Value>
</Value>
</Data>
<State>SpecialTreatmentState</State>
<StreamLocation>^HCC.SQL.Do63C8.SpecialTreaB9ADS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
