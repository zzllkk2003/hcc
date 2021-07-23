Class WS.DE.DE060007100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "两次随访间患病情况";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE060007100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060007100State</State>
<StreamLocation>^WS.DE.DE060007100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
