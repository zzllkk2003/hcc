Class WS.DE.DE051007500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "体质指数";

Parameter Format = "N5,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(MAXVAL = 99.99, MINVAL = 10, SCALE = 2);

Storage Default
{
<Data name="DE051007500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051007500State</State>
<StreamLocation>^WS.DE.DE051007500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
