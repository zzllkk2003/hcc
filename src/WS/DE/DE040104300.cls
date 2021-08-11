Class WS.DE.DE040104300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 9999, MINVAL = 100);

Parameter Category = "主诉与症状";

Parameter Description = "每天吃奶量(ml)";

Parameter Format = "N3..4";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE040104300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040104300State</State>
<StreamLocation>^WS.DE.DE040104300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
