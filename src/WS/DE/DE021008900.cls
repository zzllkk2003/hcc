Class WS.DE.DE021008900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "健康史";

Parameter Description = "重性精神疾病患者首次发病年龄(岁)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE021008900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021008900State</State>
<StreamLocation>^WS.DE.DE021008900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
