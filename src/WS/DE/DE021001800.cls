Class WS.DE.DE021001800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "肝昏迷日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As %Date(FORMAT = 8);

Storage Default
{
<Data name="DE021001800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021001800State</State>
<StreamLocation>^WS.DE.DE021001800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
