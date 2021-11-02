Class WS.DE.DE041012400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "胚驻平均直径(cm)";

Parameter Format = "N3..4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(SCALE = 1);

Storage Default
{
<Data name="DE041012400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041012400State</State>
<StreamLocation>^WS.DE.DE041012400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
