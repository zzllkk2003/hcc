Class WS.DE.DE051008100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "心电图异常标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE051008100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051008100State</State>
<StreamLocation>^WS.DE.DE051008100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
