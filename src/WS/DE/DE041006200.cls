Class WS.DE.DE041006200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "肝掌标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041006200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041006200State</State>
<StreamLocation>^WS.DE.DE041006200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
