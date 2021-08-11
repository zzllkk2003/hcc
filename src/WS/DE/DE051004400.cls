Class WS.DE.DE051004400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "医学评估";

Parameter Description = "老年人抑郁评分";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE051004400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051004400State</State>
<StreamLocation>^WS.DE.DE051004400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
