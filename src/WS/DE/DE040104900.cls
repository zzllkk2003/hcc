Class WS.DE.DE040104900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "呕吐次数(次)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE040104900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040104900State</State>
<StreamLocation>^WS.DE.DE040104900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
