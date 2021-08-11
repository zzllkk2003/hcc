Class WS.DE.DE051003100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "医学评估";

Parameter Description = "健康评价异常标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE051003100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051003100State</State>
<StreamLocation>^WS.DE.DE051003100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
