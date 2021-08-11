Class WS.DE.DE050104600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "医学诊断";

Parameter Description = "新生儿并发症标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE050104600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050104600State</State>
<StreamLocation>^WS.DE.DE050104600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
