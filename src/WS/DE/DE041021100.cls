Class WS.DE.DE041021100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "胸围（cm）";

Parameter Format = "N4..5,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(MAXVAL = 999.9, MINVAL = 10, SCALE = 1);

Storage Default
{
<Data name="DE041021100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041021100State</State>
<StreamLocation>^WS.DE.DE041021100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
