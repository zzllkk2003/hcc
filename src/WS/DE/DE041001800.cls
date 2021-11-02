Class WS.DE.DE041001800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "出生身长(cm)";

Parameter Format = "N4..5,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(SCALE = 1);

Storage Default
{
<Data name="DE041001800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041001800State</State>
<StreamLocation>^WS.DE.DE041001800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
