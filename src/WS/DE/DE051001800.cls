Class WS.DE.DE051001800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "儿童神经精神发育筛查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE051001800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051001800State</State>
<StreamLocation>^WS.DE.DE051001800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}