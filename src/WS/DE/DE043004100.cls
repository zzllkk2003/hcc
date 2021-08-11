Class WS.DE.DE043004100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "临床辅助检查";

Parameter Description = "听觉诱发电位检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE043004100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043004100State</State>
<StreamLocation>^WS.DE.DE043004100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
