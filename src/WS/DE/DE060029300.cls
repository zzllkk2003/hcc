Class WS.DE.DE060029300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Parameter Category = "计划与干预";

Parameter Description = "手术用药量";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE060029300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060029300State</State>
<StreamLocation>^WS.DE.DE060029300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
