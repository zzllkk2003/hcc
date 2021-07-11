Class WS.DE.DE041007000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "宫颈异常标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041007000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041007000State</State>
<StreamLocation>^WS.DE.DE041007000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
