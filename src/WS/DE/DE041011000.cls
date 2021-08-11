Class WS.DE.DE041011000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "体格检查";

Parameter Description = "口腔异味标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE041011000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041011000State</State>
<StreamLocation>^WS.DE.DE041011000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
