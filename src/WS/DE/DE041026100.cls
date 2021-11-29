Class WS.DE.DE041026100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "头部及其器官检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE041026100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041026100State</State>
<StreamLocation>^WS.DE.DE041026100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
