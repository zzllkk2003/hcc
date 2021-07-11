Class WS.DE.DE041013000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "皮肤苔藓样变标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041013000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041013000State</State>
<StreamLocation>^WS.DE.DE041013000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
