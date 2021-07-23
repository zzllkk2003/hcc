Class WS.DE.DE051003700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "卡氏评分值";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Storage Default
{
<Data name="DE051003700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051003700State</State>
<StreamLocation>^WS.DE.DE051003700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
