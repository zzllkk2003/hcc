Class WS.DE.DE081004200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 70, MINLEN = 0);

Parameter Category = "卫生机构";

Parameter Description = "疫苗生产厂家名称";

Parameter Format = "AN..70";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE081004200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081004200State</State>
<StreamLocation>^WS.DE.DE081004200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
