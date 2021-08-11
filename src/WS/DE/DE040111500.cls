Class WS.DE.DE040111500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Parameter Category = "主诉与症状";

Parameter Description = "症状持续时间(min)";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE040111500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040111500State</State>
<StreamLocation>^WS.DE.DE040111500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
