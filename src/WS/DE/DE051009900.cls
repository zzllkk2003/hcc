Class WS.DE.DE051009900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 2000, MINLEN = 0);

Parameter Category = "医学评估";

Parameter Description = "孕产妇死亡病历摘要或调查小结";

Parameter Format = "AN..2000";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE051009900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051009900State</State>
<StreamLocation>^WS.DE.DE051009900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
