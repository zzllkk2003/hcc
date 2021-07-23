Class WS.DE.DE060009400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "手术/操作名称";

Parameter Format = "AN..80";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 80, MINLEN = 0);

Storage Default
{
<Data name="DE060009400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060009400State</State>
<StreamLocation>^WS.DE.DE060009400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
