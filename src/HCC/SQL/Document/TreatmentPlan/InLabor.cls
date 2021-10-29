/// 治疗计划章节 - 针对于《待产记录》
Class HCC.SQL.Document.TreatmentPlan.InLabor Extends (%SerialObject, %XML.Adaptor, HCC.SQL.Base)
{

/// 处置计划
Property plan As WS.DE.DE051001400 [ SqlFieldName = plan ];

/// 计划选取的分娩方式
Property plannedDeliverWay As WS.DE.DE021001100 [ SqlFieldName = plan_delvr_way ];

/// 产程记录日期时间
Property laborProcessRecTime As WS.DE.DE090005300 [ SqlFieldName = labor_proc_rec_time ];

/// 产程经过
Property laborProcess As WS.DE.DE060019000 [ SqlFieldName = labor_proc ];

Storage Default
{
<Data name="InLaborState">
<Value name="1">
<Value>plan</Value>
</Value>
<Value name="2">
<Value>plannedDeliverWay</Value>
</Value>
<Value name="3">
<Value>laborProcessRecTime</Value>
</Value>
<Value name="4">
<Value>laborProcess</Value>
</Value>
</Data>
<State>InLaborState</State>
<StreamLocation>^HCC.SQL.Document.T63C8.InLaborS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
