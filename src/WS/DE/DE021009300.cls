Class WS.DE.DE021009300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "自然流产次数(次)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE021009300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021009300State</State>
<StreamLocation>^WS.DE.DE021009300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
