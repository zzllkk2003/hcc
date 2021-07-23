Class WS.DE.DE021002500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "畸形描述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE021002500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021002500State</State>
<StreamLocation>^WS.DE.DE021002500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
