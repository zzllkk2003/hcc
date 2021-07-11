Class WS.DE.DE021007400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "献血标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE021007400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021007400State</State>
<StreamLocation>^WS.DE.DE021007400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
