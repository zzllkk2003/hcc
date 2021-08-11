Class WS.DE.DE083000200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "卫生人员";

Parameter Description = "出国留学学习时长(月)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE083000200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083000200State</State>
<StreamLocation>^WS.DE.DE083000200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
