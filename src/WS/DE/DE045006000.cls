Class WS.DE.DE045006000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 3);

Parameter Category = "实验室检查";

Parameter Description = "尿砷检测值(mg/L)";

Parameter Format = "N5,3";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE045006000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045006000State</State>
<StreamLocation>^WS.DE.DE045006000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
