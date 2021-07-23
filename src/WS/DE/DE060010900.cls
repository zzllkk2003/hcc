Class WS.DE.DE060010900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "随访日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As %Date(FORMAT = 8);

Storage Default
{
<Data name="DE060010900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060010900State</State>
<StreamLocation>^WS.DE.DE060010900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
