Class WS.DE.DE050103400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "确诊日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As WS.DT.Date(FORMAT = 8);

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
