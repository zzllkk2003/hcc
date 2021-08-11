Class WS.DE.DE051014100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "医学评估";

Parameter Description = "手术禁忌症";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE051014100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051014100State</State>
<StreamLocation>^WS.DE.DE051014100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
