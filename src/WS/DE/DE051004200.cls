Class WS.DE.DE051004200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "老年人认知功能评分";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Storage Default
{
<Data name="DE051004200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051004200State</State>
<StreamLocation>^WS.DE.DE051004200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
