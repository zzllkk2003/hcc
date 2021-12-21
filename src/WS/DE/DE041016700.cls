Class WS.DE.DE041016700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "身高（cm）";

Parameter Format = "N4..5,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(MAXVAL = 999.9, MINVAL = 10, SCALE = 1);

Storage Default
{
<Data name="DE041016700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041016700State</State>
<StreamLocation>^WS.DE.DE041016700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
