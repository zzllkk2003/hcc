Class WS.DE.DE043000100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "临床辅助检查";

Parameter Description = "B超检查标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE043000100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043000100State</State>
<StreamLocation>^WS.DE.DE043000100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
