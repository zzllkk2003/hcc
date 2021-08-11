Class WS.DE.DE021002300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "过敏史标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE021002300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021002300State</State>
<StreamLocation>^WS.DE.DE021002300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
