Class WS.DE.DE060026300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "输血次数";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Storage Default
{
<Data name="DE060026300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060026300State</State>
<StreamLocation>^WS.DE.DE060026300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
