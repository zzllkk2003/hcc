Class WS.DE.DE060002900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Time;

Parameter Category = "计划与干预";

Parameter Description = "给(服)药时间";

Parameter Format = "T6";

Parameter ValueSet;

Parameter WSDT = "T";

Storage Default
{
<Data name="DE060002900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060002900State</State>
<StreamLocation>^WS.DE.DE060002900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
