Class WS.DE.DE041001100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "步态异常标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041001100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041001100State</State>
<StreamLocation>^WS.DE.DE041001100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}