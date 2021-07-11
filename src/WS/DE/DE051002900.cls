Class WS.DE.DE051002900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "畸形标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE051002900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051002900State</State>
<StreamLocation>^WS.DE.DE051002900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
