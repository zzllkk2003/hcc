Class WS.DE.DE043006000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "临床辅助检查";

Parameter Description = "术中病理标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE043006000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043006000State</State>
<StreamLocation>^WS.DE.DE043006000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
