Class WS.DE.DE045009500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 1);

Parameter Category = "实验室检查";

Parameter Description = "血尿素氮检测值(mmol/L)";

Parameter Format = "N..4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE045009500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045009500State</State>
<StreamLocation>^WS.DE.DE045009500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}