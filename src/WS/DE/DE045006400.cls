Class WS.DE.DE045006400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "尿微量白蛋白(mg/dL)";

Parameter Format = "N5,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As %Decimal(SCALE = 1);

Storage Default
{
<Data name="DE045006400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045006400State</State>
<StreamLocation>^WS.DE.DE045006400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
