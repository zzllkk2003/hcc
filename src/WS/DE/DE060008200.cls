Class WS.DE.DE060008200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "年度随访第次";

Parameter Format = "N..12";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999999999999, MINVAL = 0);

Storage Default
{
<Data name="DE060008200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060008200State</State>
<StreamLocation>^WS.DE.DE060008200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
