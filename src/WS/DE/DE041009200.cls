Class WS.DE.DE041009200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "基础体重（kg）";

Parameter Format = "N3..5,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(MAXVAL = 99.99, MINVAL = 0, SCALE = 2);

Storage Default
{
<Data name="DE041009200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041009200State</State>
<StreamLocation>^WS.DE.DE041009200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
