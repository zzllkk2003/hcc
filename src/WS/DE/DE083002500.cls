Class WS.DE.DE083002500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生人员";

Parameter Description = "在岗培训学时数(h)";

Parameter Format = "N..5";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99999, MINVAL = 0);

Storage Default
{
<Data name="DE083002500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083002500State</State>
<StreamLocation>^WS.DE.DE083002500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
