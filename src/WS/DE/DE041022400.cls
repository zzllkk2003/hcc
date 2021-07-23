Class WS.DE.DE041022400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "阴道异常描述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE041022400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041022400State</State>
<StreamLocation>^WS.DE.DE041022400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
