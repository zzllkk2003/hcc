Class WS.DE.DE041021900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "体格检查";

Parameter Description = "一般状况检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE041021900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041021900State</State>
<StreamLocation>^WS.DE.DE041021900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
