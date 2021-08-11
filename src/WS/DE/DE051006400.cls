Class WS.DE.DE051006400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "医学评估";

Parameter Description = "手术过程顺利标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE051006400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051006400State</State>
<StreamLocation>^WS.DE.DE051006400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
