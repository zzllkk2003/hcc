Class WS.DE.DE060023000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "计划与干预";

Parameter Description = "气管检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE060023000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060023000State</State>
<StreamLocation>^WS.DE.DE060023000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}