Class WS.DE.DE060001800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "处理及指导意见";

Parameter Format = "AN..200";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 200, MINLEN = 0);

Storage Default
{
<Data name="DE060001800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060001800State</State>
<StreamLocation>^WS.DE.DE060001800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
