Class WS.DE.DE041017200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "视物模糊标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE041017200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041017200State</State>
<StreamLocation>^WS.DE.DE041017200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
