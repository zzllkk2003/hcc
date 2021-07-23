Class WS.DE.DE043004600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "胸部X线检查异常标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE043004600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043004600State</State>
<StreamLocation>^WS.DE.DE043004600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
