Class WS.DE.DE045009300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 1);

Parameter Category = "实验室检查";

Parameter Description = "血钾浓度(mmol/L)";

Parameter Format = "N3..4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE045009300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045009300State</State>
<StreamLocation>^WS.DE.DE045009300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
