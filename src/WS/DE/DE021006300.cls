Class WS.DE.DE021006300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "双多胎标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE021006300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021006300State</State>
<StreamLocation>^WS.DE.DE021006300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
