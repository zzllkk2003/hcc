Class WS.DE.DE081000200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 70, MINLEN = 0);

Parameter Category = "卫生机构";

Parameter Description = "被处罚对象名称";

Parameter Format = "AN..70";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE081000200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081000200State</State>
<StreamLocation>^WS.DE.DE081000200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
