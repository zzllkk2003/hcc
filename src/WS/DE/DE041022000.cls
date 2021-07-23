Class WS.DE.DE041022000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "移动性浊音标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041022000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041022000State</State>
<StreamLocation>^WS.DE.DE041022000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
