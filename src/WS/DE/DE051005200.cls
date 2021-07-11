Class WS.DE.DE051005200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "日静态行为时长(min)";

Parameter Format = "N..4";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 9999, MINVAL = 0);

Storage Default
{
<Data name="DE051005200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051005200State</State>
<StreamLocation>^WS.DE.DE051005200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
