Class WS.DE.DE041021800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "腰围（cm）";

Parameter Format = "N2..5,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(MAXVAL = 999.9, MINVAL = 0, SCALE = 1);

Storage Default
{
<Data name="DE041021800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041021800State</State>
<StreamLocation>^WS.DE.DE041021800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
