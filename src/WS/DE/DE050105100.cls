Class WS.DE.DE050105100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Date(FORMAT = 8);

Parameter Category = "医学诊断";

Parameter Description = "预防接种后不良反应发生日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Storage Default
{
<Data name="DE050105100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050105100State</State>
<StreamLocation>^WS.DE.DE050105100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
