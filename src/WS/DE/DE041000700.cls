Class WS.DE.DE041000700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "鼻血标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041000700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041000700State</State>
<StreamLocation>^WS.DE.DE041000700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
