Class WS.DE.DE021007800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "健康史";

Parameter Description = "乙肝家族史标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE021007800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021007800State</State>
<StreamLocation>^WS.DE.DE021007800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
