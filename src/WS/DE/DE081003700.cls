Class WS.DE.DE081003700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "许可项目名称";

Parameter Format = "AN..500";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 500, MINLEN = 0);

Storage Default
{
<Data name="DE081003700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081003700State</State>
<StreamLocation>^WS.DE.DE081003700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
