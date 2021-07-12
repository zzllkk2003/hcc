Class WS.DE.DE060011100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "随访心理指导详细描述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE060011100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060011100State</State>
<StreamLocation>^WS.DE.DE060011100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}