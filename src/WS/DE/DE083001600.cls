Class WS.DE.DE083001600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生人员";

Parameter Description = "外聘人员数";

Parameter Format = "N..8";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99999999, MINVAL = 0);

Storage Default
{
<Data name="DE083001600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083001600State</State>
<StreamLocation>^WS.DE.DE083001600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
