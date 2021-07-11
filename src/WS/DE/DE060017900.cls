Class WS.DE.DE060017900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "医嘱备注信息";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE060017900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060017900State</State>
<StreamLocation>^WS.DE.DE060017900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
