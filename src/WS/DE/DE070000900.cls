Class WS.DE.DE070000900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 20, MINLEN = 0);

Parameter Category = "卫生费用";

Parameter Description = "住院费用分类名称";

Parameter Format = "A..20";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE070000900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE070000900State</State>
<StreamLocation>^WS.DE.DE070000900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
