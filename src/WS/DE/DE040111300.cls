Class WS.DE.DE040111300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "症状/体征发作次数";

Parameter Format = "N..5";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99999, MINVAL = 0);

Storage Default
{
<Data name="DE040111300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040111300State</State>
<StreamLocation>^WS.DE.DE040111300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
