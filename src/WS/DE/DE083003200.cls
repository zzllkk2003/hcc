Class WS.DE.DE083003200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生人员";

Parameter Description = "参加抢救人员名单";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE083003200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083003200State</State>
<StreamLocation>^WS.DE.DE083003200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
