Class WS.DE.DE043005400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "临床辅助检查";

Parameter Description = "脐带缠绕情况";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE043005400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043005400State</State>
<StreamLocation>^WS.DE.DE043005400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
