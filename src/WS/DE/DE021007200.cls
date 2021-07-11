Class WS.DE.DE021007200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "现有子女数(个)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE021007200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021007200State</State>
<StreamLocation>^WS.DE.DE021007200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
