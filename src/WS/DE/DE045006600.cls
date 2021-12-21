Class WS.DE.DE045006600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "尿液酸碱度";

Parameter Format = "N3..4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(MAXVAL = 99.9, MINVAL = 0, SCALE = 1);

Storage Default
{
<Data name="DE045006600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045006600State</State>
<StreamLocation>^WS.DE.DE045006600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
