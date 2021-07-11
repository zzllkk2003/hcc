Class WS.DE.DE060005300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "接种剂次";

Parameter Format = "N..1";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 9, MINVAL = 0);

Storage Default
{
<Data name="DE060005300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060005300State</State>
<StreamLocation>^WS.DE.DE060005300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
