Class WS.DE.DE030003100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "健康危险因素";

Parameter Description = "戒酒年龄(岁)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE030003100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030003100State</State>
<StreamLocation>^WS.DE.DE030003100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
