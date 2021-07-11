Class WS.DE.DE051010200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "孕产期高危因素标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE051010200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051010200State</State>
<StreamLocation>^WS.DE.DE051010200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
