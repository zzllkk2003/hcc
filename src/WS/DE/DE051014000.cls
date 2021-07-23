Class WS.DE.DE051014000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "简要病史";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE051014000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051014000State</State>
<StreamLocation>^WS.DE.DE051014000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
