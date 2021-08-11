Class WS.DE.DE021002000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "肝炎标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE021002000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021002000State</State>
<StreamLocation>^WS.DE.DE021002000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
