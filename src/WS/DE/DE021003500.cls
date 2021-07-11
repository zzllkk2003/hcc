Class WS.DE.DE021003500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "救治标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE021003500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021003500State</State>
<StreamLocation>^WS.DE.DE021003500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
