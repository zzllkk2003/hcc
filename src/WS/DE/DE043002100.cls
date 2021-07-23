Class WS.DE.DE043002100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "见到绒毛标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE043002100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043002100State</State>
<StreamLocation>^WS.DE.DE043002100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
