Class WS.DE.DE043000600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "临床辅助检查";

Parameter Description = "病理检查标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE043000600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043000600State</State>
<StreamLocation>^WS.DE.DE043000600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
