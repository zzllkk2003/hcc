Class WS.DE.DE045012700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "血清谷草转氨酶值(U/L)";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Storage Default
{
<Data name="DE045012700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045012700State</State>
<StreamLocation>^WS.DE.DE045012700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
