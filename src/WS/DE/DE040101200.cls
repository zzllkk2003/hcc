Class WS.DE.DE040101200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "恶心标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE040101200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040101200State</State>
<StreamLocation>^WS.DE.DE040101200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
