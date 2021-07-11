Class WS.DE.DE060028100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "常规监测项目结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE060028100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060028100State</State>
<StreamLocation>^WS.DE.DE060028100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
