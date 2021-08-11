/// 治理计划 - 随访
Class HCC.SQL.Document.TreatmentPlan.Followup Extends (%SerialObject, %XML.Adaptor)
{

/// 随访方式代码表。用于《治疗记录》
Property code As WS.DE.DE060010800 [ SqlFieldName = code ];

/// 随访时间。用于《治疗记录》
Property fdate As WS.DE.DE060010900 [ SqlFieldName = fdate ];

/// 随访周期建议代码。用于《治疗记录》
Property period As WS.DE.DE060011200 [ SqlFieldName = period ];

Storage Default
{
<Data name="FollowupState">
<Value name="1">
<Value>code</Value>
</Value>
<Value name="2">
<Value>fdate</Value>
</Value>
<Value name="3">
<Value>period</Value>
</Value>
</Data>
<State>FollowupState</State>
<StreamLocation>^HCC.SQL.Document63C8.FollowupS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
