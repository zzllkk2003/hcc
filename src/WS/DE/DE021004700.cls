Class WS.DE.DE021004700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "绝经标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE021004700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021004700State</State>
<StreamLocation>^WS.DE.DE021004700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
