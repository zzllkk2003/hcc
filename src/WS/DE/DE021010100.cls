Class WS.DE.DE021010100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "健康史";

Parameter Description = "预防接种史";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE021010100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021010100State</State>
<StreamLocation>^WS.DE.DE021010100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
