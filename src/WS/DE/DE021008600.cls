Class WS.DE.DE021008600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "窒息标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE021008600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021008600State</State>
<StreamLocation>^WS.DE.DE021008600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
