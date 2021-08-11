Class WS.DE.DE060004200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "计划与干预";

Parameter Description = "婚前卫生指导内容";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE060004200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060004200State</State>
<StreamLocation>^WS.DE.DE060004200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
