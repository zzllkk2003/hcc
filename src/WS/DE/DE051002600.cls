Class WS.DE.DE051002600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Date(FORMAT = 8);

Parameter Category = "医学评估";

Parameter Description = "复发日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Storage Default
{
<Data name="DE051002600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051002600State</State>
<StreamLocation>^WS.DE.DE051002600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
