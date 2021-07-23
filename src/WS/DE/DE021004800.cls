Class WS.DE.DE021004800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "绝经年龄(岁)";

Parameter Format = "N2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 10);

Storage Default
{
<Data name="DE021004800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021004800State</State>
<StreamLocation>^WS.DE.DE021004800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
