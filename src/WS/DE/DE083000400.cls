Class WS.DE.DE083000400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 999999, MINVAL = 0);

Parameter Category = "卫生人员";

Parameter Description = "岗前培训人次数(人次)";

Parameter Format = "N..6";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE083000400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083000400State</State>
<StreamLocation>^WS.DE.DE083000400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
