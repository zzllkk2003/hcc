Class WS.DE.DE045005100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 3);

Parameter Category = "实验室检查";

Parameter Description = "尿氟检测值(mg/L)";

Parameter Format = "N4..5,3";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE045005100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045005100State</State>
<StreamLocation>^WS.DE.DE045005100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
