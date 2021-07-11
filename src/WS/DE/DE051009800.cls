Class WS.DE.DE051009800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "预产期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Property Value As %Date(FORMAT = 8);

Storage Default
{
<Data name="DE051009800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051009800State</State>
<StreamLocation>^WS.DE.DE051009800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
