Class WS.DE.DE045010200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 1);

Parameter Category = "实验室检查";

Parameter Description = "血糖检测值(mmol/L)";

Parameter Format = "N3..4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE045010200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045010200State</State>
<StreamLocation>^WS.DE.DE045010200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
