Class WS.DE.DE060011900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 200, MINLEN = 0);

Parameter Category = "计划与干预";

Parameter Description = "新生儿处理及指导意见";

Parameter Format = "AN..200";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE060011900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060011900State</State>
<StreamLocation>^WS.DE.DE060011900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
