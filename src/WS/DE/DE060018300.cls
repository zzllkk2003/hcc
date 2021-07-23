Class WS.DE.DE060018300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "病情概括及主要抢救措施";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE060018300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060018300State</State>
<StreamLocation>^WS.DE.DE060018300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
