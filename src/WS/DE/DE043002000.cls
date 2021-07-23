Class WS.DE.DE043002000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "检查/检验项目名称";

Parameter Format = "AN..80";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 80, MINLEN = 0);

Storage Default
{
<Data name="DE043002000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043002000State</State>
<StreamLocation>^WS.DE.DE043002000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
