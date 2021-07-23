Class WS.DE.DE083000500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生人员";

Parameter Description = "岗前培训学时数(h)";

Parameter Format = "N..6";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999999, MINVAL = 0);

Storage Default
{
<Data name="DE083000500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083000500State</State>
<StreamLocation>^WS.DE.DE083000500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
