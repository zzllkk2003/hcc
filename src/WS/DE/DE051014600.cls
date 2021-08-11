Class WS.DE.DE051014600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "医学评估";

Parameter Description = "基础疾病对麻醉可能产生的影响";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE051014600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051014600State</State>
<StreamLocation>^WS.DE.DE051014600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
