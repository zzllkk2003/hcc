Class WS.DE.DE041024200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 999, MINVAL = 10);

Parameter Category = "体格检查";

Parameter Description = "孕周(d)";

Parameter Format = "N2..3";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE041024200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041024200State</State>
<StreamLocation>^WS.DE.DE041024200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
