Class WS.DE.DE041017000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "视力检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE041017000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041017000State</State>
<StreamLocation>^WS.DE.DE041017000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
