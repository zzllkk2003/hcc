Class WS.DE.DE045002500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "甘油三酯值(mmol/L)";

Parameter Format = "N..3,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As %Decimal(SCALE = 1);

Storage Default
{
<Data name="DE045002500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045002500State</State>
<StreamLocation>^WS.DE.DE045002500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
