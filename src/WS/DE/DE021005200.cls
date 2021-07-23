Class WS.DE.DE021005200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "脾切除标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE021005200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021005200State</State>
<StreamLocation>^WS.DE.DE021005200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
