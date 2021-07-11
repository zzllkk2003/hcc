Class WS.DE.DE030003200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "戒烟年龄(岁)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE030003200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030003200State</State>
<StreamLocation>^WS.DE.DE030003200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
