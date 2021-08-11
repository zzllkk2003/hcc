Class WS.DE.DE040100300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 9999, MINVAL = 0);

Parameter Category = "主诉与症状";

Parameter Description = "产后开奶时长(min)";

Parameter Format = "N..4";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE040100300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040100300State</State>
<StreamLocation>^WS.DE.DE040100300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
