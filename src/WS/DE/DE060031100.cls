Class WS.DE.DE060031100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "计划与干预";

Parameter Description = "胎儿娩出助产标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE060031100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060031100State</State>
<StreamLocation>^WS.DE.DE060031100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}