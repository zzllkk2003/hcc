Class WS.DE.DE070000300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生费用";

Parameter Description = "门诊费用分类名称";

Parameter Format = "A..20";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 20, MINLEN = 0);

Storage Default
{
<Data name="DE070000300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE070000300State</State>
<StreamLocation>^WS.DE.DE070000300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
