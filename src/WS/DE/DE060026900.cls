Class WS.DE.DE060026900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "计划与干预";

Parameter Description = "术中输液项目";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE060026900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060026900State</State>
<StreamLocation>^WS.DE.DE060026900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
