Class WS.DE.DE060017700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "计划与干预";

Parameter Description = "转诊原因";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE060017700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060017700State</State>
<StreamLocation>^WS.DE.DE060017700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
