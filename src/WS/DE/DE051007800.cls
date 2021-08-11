Class WS.DE.DE051007800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "医学评估";

Parameter Description = "危重孕产妇标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE051007800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051007800State</State>
<StreamLocation>^WS.DE.DE051007800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
