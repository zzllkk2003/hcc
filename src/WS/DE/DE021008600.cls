Class WS.DE.DE021008600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "健康史";

Parameter Description = "窒息标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

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
