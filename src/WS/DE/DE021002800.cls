Class WS.DE.DE021002800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "观察结果";

Parameter Format = "A..200";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 200, MINLEN = 0);

Storage Default
{
<Data name="DE021002800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021002800State</State>
<StreamLocation>^WS.DE.DE021002800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
