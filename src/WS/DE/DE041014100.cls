Class WS.DE.DE041014100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "扑翼样震颤标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041014100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041014100State</State>
<StreamLocation>^WS.DE.DE041014100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
