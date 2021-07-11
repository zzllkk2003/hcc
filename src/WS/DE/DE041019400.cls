Class WS.DE.DE041019400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "臀红标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041019400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041019400State</State>
<StreamLocation>^WS.DE.DE041019400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
