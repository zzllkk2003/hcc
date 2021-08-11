Class WS.DE.DE041001300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "体格检查";

Parameter Description = "产前检查标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE041001300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041001300State</State>
<StreamLocation>^WS.DE.DE041001300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
