Class WS.DE.DE083001200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 999999, MINVAL = 0);

Parameter Category = "卫生人员";

Parameter Description = "培训学时数(h)";

Parameter Format = "N..6";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE083001200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083001200State</State>
<StreamLocation>^WS.DE.DE083001200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
