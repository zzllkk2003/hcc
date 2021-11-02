Class WS.DE.DE045003200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "甲胎蛋白值(ug/L)";

Parameter Format = "N..5,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(SCALE = 1);

Storage Default
{
<Data name="DE045003200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045003200State</State>
<StreamLocation>^WS.DE.DE045003200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
