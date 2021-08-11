Class WS.DE.DE041012800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "体格检查";

Parameter Description = "皮肤黄染标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE041012800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041012800State</State>
<StreamLocation>^WS.DE.DE041012800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
