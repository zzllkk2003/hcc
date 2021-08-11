Class WS.DE.DE051016300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "医学评估";

Parameter Description = "阴道裂伤标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE051016300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051016300State</State>
<StreamLocation>^WS.DE.DE051016300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
