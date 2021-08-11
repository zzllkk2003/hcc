Class WS.DE.DE045003700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 1);

Parameter Category = "实验室检查";

Parameter Description = "空腹血糖值(mmol/L)";

Parameter Format = "N3..4,1";

Parameter ValueSet;

Parameter WSDT = "F";

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
