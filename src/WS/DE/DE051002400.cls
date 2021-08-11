Class WS.DE.DE051002400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "医学评估";

Parameter Description = "复发标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE051002400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051002400State</State>
<StreamLocation>^WS.DE.DE051002400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
