Class WS.DE.DE021009700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "个人史";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 500, MINLEN = 0);

Storage Default
{
<Data name="DE021009700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021009700State</State>
<StreamLocation>^WS.DE.DE021009700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
