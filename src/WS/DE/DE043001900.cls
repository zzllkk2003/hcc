Class WS.DE.DE043001900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 20, MINLEN = 0);

Parameter Category = "临床辅助检查";

Parameter Description = "检查/检验项目代码";

Parameter Format = "AN..20";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE043001900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043001900State</State>
<StreamLocation>^WS.DE.DE043001900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
