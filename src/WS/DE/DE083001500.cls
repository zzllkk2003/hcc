Class WS.DE.DE083001500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生人员";

Parameter Description = "人员资质类别名称";

Parameter Format = "A..50";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 50, MINLEN = 0);

Storage Default
{
<Data name="DE083001500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083001500State</State>
<StreamLocation>^WS.DE.DE083001500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
