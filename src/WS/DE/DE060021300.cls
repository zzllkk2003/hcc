Class WS.DE.DE060021300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "计划与干预";

Parameter Description = "会阴血肿处理";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE060021300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060021300State</State>
<StreamLocation>^WS.DE.DE060021300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
