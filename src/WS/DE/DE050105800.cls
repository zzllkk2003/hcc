Class WS.DE.DE050105800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "诊断日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As WS.DT.Date(FORMAT = 8);

Storage Default
{
<Data name="DE050105800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050105800State</State>
<StreamLocation>^WS.DE.DE050105800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
