Class WS.DE.DE060027800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "病危（重）通知内容";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE060027800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060027800State</State>
<StreamLocation>^WS.DE.DE060027800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}