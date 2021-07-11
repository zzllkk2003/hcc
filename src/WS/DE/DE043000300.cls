Class WS.DE.DE043000300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "B超检查异常标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE043000300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043000300State</State>
<StreamLocation>^WS.DE.DE043000300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
