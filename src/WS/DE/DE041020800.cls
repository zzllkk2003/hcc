Class WS.DE.DE041020800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "心脏听诊异常标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041020800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041020800State</State>
<StreamLocation>^WS.DE.DE041020800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}