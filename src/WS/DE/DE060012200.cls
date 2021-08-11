Class WS.DE.DE060012200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "计划与干预";

Parameter Description = "新生儿抢救标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE060012200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060012200State</State>
<StreamLocation>^WS.DE.DE060012200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
