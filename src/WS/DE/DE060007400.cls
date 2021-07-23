Class WS.DE.DE060007400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "麻醉方法名称";

Parameter Format = "AN..50";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 50, MINLEN = 0);

Storage Default
{
<Data name="DE060007400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060007400State</State>
<StreamLocation>^WS.DE.DE060007400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
