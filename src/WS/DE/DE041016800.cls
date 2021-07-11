Class WS.DE.DE041016800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "肾区叩痛标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041016800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041016800State</State>
<StreamLocation>^WS.DE.DE041016800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
