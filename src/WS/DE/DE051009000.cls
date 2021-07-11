Class WS.DE.DE051009000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "新生儿其他遗传代谢病筛查";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE051009000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051009000State</State>
<StreamLocation>^WS.DE.DE051009000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
