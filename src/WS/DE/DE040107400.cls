Class WS.DE.DE040107400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "主诉与症状";

Parameter Description = "抬头月龄(月 )";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE040107400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040107400State</State>
<StreamLocation>^WS.DE.DE040107400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
