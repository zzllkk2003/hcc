Class WS.DE.DE041019900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "五官检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE041019900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041019900State</State>
<StreamLocation>^WS.DE.DE041019900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
