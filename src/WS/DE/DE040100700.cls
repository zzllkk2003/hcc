Class WS.DE.DE040100700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "主诉与症状";

Parameter Description = "大便次数(次/d)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE040100700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040100700State</State>
<StreamLocation>^WS.DE.DE040100700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
