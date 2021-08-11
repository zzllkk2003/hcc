Class WS.DE.DE041016600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 1);

Parameter Category = "体格检查";

Parameter Description = "身长(cm)";

Parameter Format = "N4..5,1";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE041016600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041016600State</State>
<StreamLocation>^WS.DE.DE041016600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
