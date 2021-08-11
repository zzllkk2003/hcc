Class WS.DE.DE050103400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Date(FORMAT = 8);

Parameter Category = "医学诊断";

Parameter Description = "确诊日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Storage Default
{
<Data name="DE050103400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050103400State</State>
<StreamLocation>^WS.DE.DE050103400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
