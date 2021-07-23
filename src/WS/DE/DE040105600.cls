Class WS.DE.DE040105600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "全天睡眠时长";

Parameter Format = "N..4";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 9999, MINVAL = 0);

Storage Default
{
<Data name="DE040105600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040105600State</State>
<StreamLocation>^WS.DE.DE040105600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
