Class WS.DE.DE021001900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "肝昏迷标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE021001900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021001900State</State>
<StreamLocation>^WS.DE.DE021001900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
