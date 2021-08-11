Class WS.DE.DE051010400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "医学评估";

Parameter Description = "孕妇高危评分值(分)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE051010400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051010400State</State>
<StreamLocation>^WS.DE.DE051010400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
