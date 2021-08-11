Class WS.DE.DE060003800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 200, MINLEN = 0);

Parameter Category = "计划与干预";

Parameter Description = "会诊意见";

Parameter Format = "AN..200";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE060003800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060003800State</State>
<StreamLocation>^WS.DE.DE060003800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
