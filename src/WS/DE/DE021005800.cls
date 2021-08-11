Class WS.DE.DE021005800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "上消化道出血标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE021005800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021005800State</State>
<StreamLocation>^WS.DE.DE021005800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
