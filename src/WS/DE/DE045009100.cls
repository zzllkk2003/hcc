Class WS.DE.DE045009100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Parameter Category = "实验室检查";

Parameter Description = "血红蛋白值(g/L)";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE045009100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045009100State</State>
<StreamLocation>^WS.DE.DE045009100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
