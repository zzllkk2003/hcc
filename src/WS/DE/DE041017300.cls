Class WS.DE.DE041017300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "体格检查";

Parameter Description = "视野检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE041017300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041017300State</State>
<StreamLocation>^WS.DE.DE041017300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
