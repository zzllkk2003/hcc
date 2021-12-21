Class WS.DE.DE045004600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "尿比重";

Parameter Format = "N5,3";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(MAXVAL = 9.999, MINVAL = 0, SCALE = 3);

Storage Default
{
<Data name="DE045004600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045004600State</State>
<StreamLocation>^WS.DE.DE045004600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
