Class WS.DE.DE041011600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "裸眼远视力值";

Parameter Format = "N3,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As %Decimal(SCALE = 1);

Storage Default
{
<Data name="DE041011600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041011600State</State>
<StreamLocation>^WS.DE.DE041011600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
