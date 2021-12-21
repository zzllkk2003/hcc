Class WS.DE.DE041006700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "宫底高度（cm）";

Parameter Format = "N3..4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(MAXVAL = 99.9, MINVAL = 1, SCALE = 1);

Storage Default
{
<Data name="DE041006700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041006700State</State>
<StreamLocation>^WS.DE.DE041006700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
