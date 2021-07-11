Class WS.DE.DE083001100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生人员";

Parameter Description = "接受培训学时数";

Parameter Format = "N..5";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99999, MINVAL = 0);

Storage Default
{
<Data name="DE083001100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083001100State</State>
<StreamLocation>^WS.DE.DE083001100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
