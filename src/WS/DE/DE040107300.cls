Class WS.DE.DE040107300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "胎动孕周(d)";

Parameter Format = "N2..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 10);

Storage Default
{
<Data name="DE040107300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040107300State</State>
<StreamLocation>^WS.DE.DE040107300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
