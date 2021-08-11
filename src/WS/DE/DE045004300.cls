Class WS.DE.DE045004300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 3);

Parameter Category = "实验室检查";

Parameter Description = "尿β2-微球蛋白值(mg/L)";

Parameter Format = "N5,3";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE045004300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045004300State</State>
<StreamLocation>^WS.DE.DE045004300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
