Class WS.DE.DE021008200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "健康史";

Parameter Description = "阴道助产次数(次)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE021008200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021008200State</State>
<StreamLocation>^WS.DE.DE021008200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
