Class WS.DE.DE045001100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 1);

Parameter Category = "实验室检查";

Parameter Description = "癌胚抗原浓度值(μg/L)";

Parameter Format = "N..4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE045001100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045001100State</State>
<StreamLocation>^WS.DE.DE045001100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}