Class WS.DE.DE040102300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "主诉与症状";

Parameter Description = "腹泻次数(次)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE040102300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040102300State</State>
<StreamLocation>^WS.DE.DE040102300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
