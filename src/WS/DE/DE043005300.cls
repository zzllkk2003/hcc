Class WS.DE.DE043005300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "临床辅助检查";

Parameter Description = "宫腔探查异常情况标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE043005300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043005300State</State>
<StreamLocation>^WS.DE.DE043005300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
