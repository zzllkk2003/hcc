Class WS.DE.DE045004400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "尿δ-氨基乙酰丙酸值(mg/L)";

Parameter Format = "N4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(SCALE = 1);

Storage Default
{
<Data name="DE045004400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045004400State</State>
<StreamLocation>^WS.DE.DE045004400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
