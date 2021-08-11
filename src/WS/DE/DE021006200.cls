Class WS.DE.DE021006200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "手术标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE021006200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021006200State</State>
<StreamLocation>^WS.DE.DE021006200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
