Class WS.DE.DE081004600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99999999, MINVAL = 0);

Parameter Category = "卫生机构";

Parameter Description = "职工总数";

Parameter Format = "N..8";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE081004600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081004600State</State>
<StreamLocation>^WS.DE.DE081004600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
