Class WS.DE.DE045009900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "血清谷丙转氨酶值(U/L)";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Storage Default
{
<Data name="DE045009900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045009900State</State>
<StreamLocation>^WS.DE.DE045009900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
