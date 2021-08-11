Class WS.DE.DE060001300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "撤销随访管理日期时间";

Parameter Format = "DT15";

Parameter ValueSet;

Parameter WSDT = "DT";

Property Value As WS.DT.TimeStamp;

Storage Default
{
<Data name="DE060001300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060001300State</State>
<StreamLocation>^WS.DE.DE060001300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
