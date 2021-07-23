Class WS.DE.DE060002800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "附睾端包埋操作标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE060002800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060002800State</State>
<StreamLocation>^WS.DE.DE060002800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
