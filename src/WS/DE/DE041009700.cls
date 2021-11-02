Class WS.DE.DE041009700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "矫正近视力值";

Parameter Format = "N3,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(SCALE = 1);

Storage Default
{
<Data name="DE041009700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041009700State</State>
<StreamLocation>^WS.DE.DE041009700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
