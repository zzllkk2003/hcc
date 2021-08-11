Class WS.DE.DE060002100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 9999, MINVAL = 0);

Parameter Category = "计划与干预";

Parameter Description = "第一产程时长(min)";

Parameter Format = "N..4";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE060002100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060002100State</State>
<StreamLocation>^WS.DE.DE060002100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
