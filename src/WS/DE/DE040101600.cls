Class WS.DE.DE040101600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "主诉与症状";

Parameter Description = "耳聋标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE040101600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040101600State</State>
<StreamLocation>^WS.DE.DE040101600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
