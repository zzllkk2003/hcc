Class WS.DE.DE060023300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "清醒时间";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "T";

Property Value As %Time;

Storage Default
{
<Data name="DE060023300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060023300State</State>
<StreamLocation>^WS.DE.DE060023300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
