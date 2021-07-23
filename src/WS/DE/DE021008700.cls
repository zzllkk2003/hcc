Class WS.DE.DE021008700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "肿瘤家族史标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE021008700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021008700State</State>
<StreamLocation>^WS.DE.DE021008700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
