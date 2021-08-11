Class WS.DE.DE021006900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "外伤标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE021006900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021006900State</State>
<StreamLocation>^WS.DE.DE021006900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
