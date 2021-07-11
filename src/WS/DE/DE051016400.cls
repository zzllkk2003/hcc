Class WS.DE.DE051016400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "阴道血肿标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE051016400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051016400State</State>
<StreamLocation>^WS.DE.DE051016400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
