Class WS.DE.DE051016100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "医学评估";

Parameter Description = "产前检查异常情况";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE051016100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051016100State</State>
<StreamLocation>^WS.DE.DE051016100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
