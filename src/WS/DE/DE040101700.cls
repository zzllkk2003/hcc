Class WS.DE.DE040101700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "主诉与症状";

Parameter Description = "耳鸣标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE040101700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040101700State</State>
<StreamLocation>^WS.DE.DE040101700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
