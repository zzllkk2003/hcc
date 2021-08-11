Class WS.DE.DE050100600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "医学诊断";

Parameter Description = "尘肺合并肺结核的标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE050100600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050100600State</State>
<StreamLocation>^WS.DE.DE050100600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
