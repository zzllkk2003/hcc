Class WS.DE.DE060029400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "处方有效天数";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Storage Default
{
<Data name="DE060029400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060029400State</State>
<StreamLocation>^WS.DE.DE060029400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
