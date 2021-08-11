Class WS.DE.DE051010300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 999, MINVAL = 10);

Parameter Category = "医学评估";

Parameter Description = "孕妇高危评分孕周(d)";

Parameter Format = "N2..3";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE051010300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051010300State</State>
<StreamLocation>^WS.DE.DE051010300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
