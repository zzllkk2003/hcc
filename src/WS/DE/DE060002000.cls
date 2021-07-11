Class WS.DE.DE060002000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "第三产程时长(min)";

Parameter Format = "N..4";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 9999, MINVAL = 0);

Storage Default
{
<Data name="DE060002000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060002000State</State>
<StreamLocation>^WS.DE.DE060002000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
