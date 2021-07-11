Class WS.DE.DE040108300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "外伤出血时间(s)";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Storage Default
{
<Data name="DE040108300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040108300State</State>
<StreamLocation>^WS.DE.DE040108300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
