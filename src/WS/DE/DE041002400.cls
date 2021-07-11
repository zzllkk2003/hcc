Class WS.DE.DE041002400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "动作不灵活标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041002400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041002400State</State>
<StreamLocation>^WS.DE.DE041002400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
