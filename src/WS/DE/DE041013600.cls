Class WS.DE.DE041013600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "体格检查";

Parameter Description = "皮疹标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE041013600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041013600State</State>
<StreamLocation>^WS.DE.DE041013600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
