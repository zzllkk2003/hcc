Class WS.DE.DE045012500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 2);

Parameter Category = "实验室检查";

Parameter Description = "总胆固醇值(mmol/L)";

Parameter Format = "N..5,2";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE045012500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045012500State</State>
<StreamLocation>^WS.DE.DE045012500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
