Class WS.DE.DE060030200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "计划与干预";

Parameter Description = "手术方式";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE060030200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060030200State</State>
<StreamLocation>^WS.DE.DE060030200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
