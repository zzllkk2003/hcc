Class WS.DE.DE045010800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "血小板计数值(G/L)";

Parameter Format = "N2..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 10);

Storage Default
{
<Data name="DE045010800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045010800State</State>
<StreamLocation>^WS.DE.DE045010800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
