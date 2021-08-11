Class WS.DE.DE041023600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 9999, MINVAL = 0);

Parameter Category = "体格检查";

Parameter Description = "总产程时长(min)";

Parameter Format = "N..4";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE041023600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041023600State</State>
<StreamLocation>^WS.DE.DE041023600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
