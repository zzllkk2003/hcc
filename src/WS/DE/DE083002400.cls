Class WS.DE.DE083002400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生人员";

Parameter Description = "在岗培训人次数(人次)";

Parameter Format = "N..5";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99999, MINVAL = 0);

Storage Default
{
<Data name="DE083002400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083002400State</State>
<StreamLocation>^WS.DE.DE083002400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
