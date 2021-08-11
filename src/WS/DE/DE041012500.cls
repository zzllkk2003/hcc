Class WS.DE.DE041012500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "体格检查";

Parameter Description = "皮肤粗糙标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE041012500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041012500State</State>
<StreamLocation>^WS.DE.DE041012500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
