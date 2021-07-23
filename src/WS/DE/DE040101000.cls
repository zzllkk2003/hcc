Class WS.DE.DE040101000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "多汗部位";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE040101000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040101000State</State>
<StreamLocation>^WS.DE.DE040101000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
