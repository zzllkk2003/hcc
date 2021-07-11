Class WS.DE.DE041019200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "头围(cm)";

Parameter Format = "N4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As %Decimal(SCALE = 1);

Storage Default
{
<Data name="DE041019200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041019200State</State>
<StreamLocation>^WS.DE.DE041019200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
