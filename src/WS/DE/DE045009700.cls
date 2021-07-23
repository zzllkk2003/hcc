Class WS.DE.DE045009700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "血清低密度脂蛋白胆固醇检测值(mmol/L)";

Parameter Format = "N..5,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As %Decimal(SCALE = 2);

Storage Default
{
<Data name="DE045009700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045009700State</State>
<StreamLocation>^WS.DE.DE045009700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
