Class WS.DE.DE060015600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "知情同意签字日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As %Date(FORMAT = 8);

Storage Default
{
<Data name="DE060015600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060015600State</State>
<StreamLocation>^WS.DE.DE060015600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
