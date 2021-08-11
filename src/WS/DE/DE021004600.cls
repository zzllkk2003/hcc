Class WS.DE.DE021004600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "传染病接触史标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE021004600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021004600State</State>
<StreamLocation>^WS.DE.DE021004600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
