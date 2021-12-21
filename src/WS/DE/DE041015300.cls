Class WS.DE.DE041015300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "前囟纵径（cm）";

Parameter Format = "N3,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(MAXVAL = 9.9, MINVAL = 0, SCALE = 1);

Storage Default
{
<Data name="DE041015300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041015300State</State>
<StreamLocation>^WS.DE.DE041015300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
