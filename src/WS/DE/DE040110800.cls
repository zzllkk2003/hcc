Class WS.DE.DE040110800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "孕次";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE040110800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040110800State</State>
<StreamLocation>^WS.DE.DE040110800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
