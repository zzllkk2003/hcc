Class WS.DE.DE060003700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "会诊日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As %Date(FORMAT = 8);

Storage Default
{
<Data name="DE060003700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060003700State</State>
<StreamLocation>^WS.DE.DE060003700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
