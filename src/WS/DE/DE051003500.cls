Class WS.DE.DE051003500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "医学评估";

Parameter Description = "结案标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE051003500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051003500State</State>
<StreamLocation>^WS.DE.DE051003500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
