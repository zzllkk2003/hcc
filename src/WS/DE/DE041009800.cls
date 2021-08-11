Class WS.DE.DE041009800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 1);

Parameter Category = "体格检查";

Parameter Description = "矫正远视力值";

Parameter Format = "N3,1";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE041009800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041009800State</State>
<StreamLocation>^WS.DE.DE041009800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}