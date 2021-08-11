Class WS.DE.DE045012600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 1);

Parameter Category = "实验室检查";

Parameter Description = "总胆红素值(μmol/L)";

Parameter Format = "N..4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE045012600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045012600State</State>
<StreamLocation>^WS.DE.DE045012600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
