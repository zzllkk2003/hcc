Class WS.DE.DE081002600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 50, MINLEN = 0);

Parameter Category = "卫生机构";

Parameter Description = "科室名称";

Parameter Format = "AN..50";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE081002600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081002600State</State>
<StreamLocation>^WS.DE.DE081002600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
