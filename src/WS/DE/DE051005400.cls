Class WS.DE.DE051005400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "筛查结果通知日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As WS.DT.Date(FORMAT = 8);

Storage Default
{
<Data name="DE051005400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051005400State</State>
<StreamLocation>^WS.DE.DE051005400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
