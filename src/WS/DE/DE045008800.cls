Class WS.DE.DE045008800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "血β-绒毛膜促性腺激素值(IU/L)";

Parameter Format = "N3..4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(SCALE = 1);

Storage Default
{
<Data name="DE045008800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045008800State</State>
<StreamLocation>^WS.DE.DE045008800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
