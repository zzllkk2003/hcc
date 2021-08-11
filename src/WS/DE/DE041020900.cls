Class WS.DE.DE041020900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "体格检查";

Parameter Description = "心脏杂音标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE041020900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041020900State</State>
<StreamLocation>^WS.DE.DE041020900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
