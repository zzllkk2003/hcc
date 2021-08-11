Class WS.DE.DE070001100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 20, MINLEN = 0);

Parameter Category = "卫生费用";

Parameter Description = "收费项目";

Parameter Format = "A..20";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE070001100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE070001100State</State>
<StreamLocation>^WS.DE.DE070001100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
