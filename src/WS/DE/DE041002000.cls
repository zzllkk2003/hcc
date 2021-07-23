Class WS.DE.DE041002000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "出生头围(cm)";

Parameter Format = "N4..5,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As %Decimal(SCALE = 1);

Storage Default
{
<Data name="DE041002000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041002000State</State>
<StreamLocation>^WS.DE.DE041002000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
