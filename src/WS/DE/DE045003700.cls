Class WS.DE.DE045003700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "空腹血糖值(mmol/L)";

Parameter Format = "N3..4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(MAXVAL = 99.9, MINVAL = 0, SCALE = 1);

Storage Default
{
<Data name="DE045003700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045003700State</State>
<StreamLocation>^WS.DE.DE045003700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
