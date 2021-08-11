Class WS.DE.DE051000300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "医学评估";

Parameter Description = "艾滋病患者标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE051000300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051000300State</State>
<StreamLocation>^WS.DE.DE051000300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
