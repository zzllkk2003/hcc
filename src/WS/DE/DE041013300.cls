Class WS.DE.DE041013300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "皮下脂肪（cm）";

Parameter Format = "N4..5,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(MAXVAL = 99.9, MINVAL = 0, SCALE = 1);

Storage Default
{
<Data name="DE041013300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041013300State</State>
<StreamLocation>^WS.DE.DE041013300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
