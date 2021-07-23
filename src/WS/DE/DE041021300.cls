Class WS.DE.DE041021300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "牙齿松动标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041021300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041021300State</State>
<StreamLocation>^WS.DE.DE041021300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
