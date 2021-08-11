Class WS.DE.DE045001900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 1);

Parameter Category = "实验室检查";

Parameter Description = "餐后两小时血糖值(mmol/L)";

Parameter Format = "N3..4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE045001900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045001900State</State>
<StreamLocation>^WS.DE.DE045001900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}