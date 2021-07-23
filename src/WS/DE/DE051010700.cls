Class WS.DE.DE051010700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "早孕反应标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE051010700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051010700State</State>
<StreamLocation>^WS.DE.DE051010700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
