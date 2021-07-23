Class WS.DE.DE050102300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "怀孕标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE050102300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050102300State</State>
<StreamLocation>^WS.DE.DE050102300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
