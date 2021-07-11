Class WS.DE.DE051014900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "体格检查--神经系统检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE051014900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051014900State</State>
<StreamLocation>^WS.DE.DE051014900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
