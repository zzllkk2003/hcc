Class WS.DE.DE041018800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 2);

Parameter Category = "体格检查";

Parameter Description = "体重(kg)";

Parameter Format = "N3..5,2";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE041018800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041018800State</State>
<StreamLocation>^WS.DE.DE041018800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
