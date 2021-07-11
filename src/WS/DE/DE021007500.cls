Class WS.DE.DE021007500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "新生儿死亡例数";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE021007500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021007500State</State>
<StreamLocation>^WS.DE.DE021007500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
