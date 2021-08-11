Class WS.DE.DE041018600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 1);

Parameter Category = "体格检查";

Parameter Description = "体温(°C )";

Parameter Format = "N4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE041018600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041018600State</State>
<StreamLocation>^WS.DE.DE041018600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
