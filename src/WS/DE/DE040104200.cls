Class WS.DE.DE040104200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "主诉与症状";

Parameter Description = "每天吃奶次数";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE040104200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040104200State</State>
<StreamLocation>^WS.DE.DE040104200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
