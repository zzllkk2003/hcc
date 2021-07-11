Class WS.DE.DE041014600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "脐带脱落标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041014600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041014600State</State>
<StreamLocation>^WS.DE.DE041014600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
