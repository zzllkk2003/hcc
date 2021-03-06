Class WS.DE.DE041005200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "腹围（cm）";

Parameter Format = "N4..5,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(MAXVAL = 999.9, MINVAL = 10, SCALE = 1);

Storage Default
{
<Data name="DE041005200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041005200State</State>
<StreamLocation>^WS.DE.DE041005200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
