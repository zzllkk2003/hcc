Class WS.DE.DE040100600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "主诉与症状";

Parameter Description = "出牙月龄(月 )";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE040100600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040100600State</State>
<StreamLocation>^WS.DE.DE040100600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
