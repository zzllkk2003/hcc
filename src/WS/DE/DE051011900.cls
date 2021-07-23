Class WS.DE.DE051011900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "住院者传染性标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE051011900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051011900State</State>
<StreamLocation>^WS.DE.DE051011900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
