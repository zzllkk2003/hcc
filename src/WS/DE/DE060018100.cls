Class WS.DE.DE060018100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 1000, MINLEN = 0);

Parameter Category = "计划与干预";

Parameter Description = "急诊留观病程记录";

Parameter Format = "AN..1000";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE060018100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060018100State</State>
<StreamLocation>^WS.DE.DE060018100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
