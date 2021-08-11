Class WS.DE.DE060018200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "分娩过程摘要";

Parameter Format = "AN..1000";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 1000, MINLEN = 0);

Storage Default
{
<Data name="DE060018200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060018200State</State>
<StreamLocation>^WS.DE.DE060018200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}