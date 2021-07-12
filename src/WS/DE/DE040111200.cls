Class WS.DE.DE040111200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "症状/体征发作持续天数(d";

Parameter Format = "N..5";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99999, MINVAL = 0);

Storage Default
{
<Data name="DE040111200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040111200State</State>
<StreamLocation>^WS.DE.DE040111200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}