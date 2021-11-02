Class WS.DE.DE081003100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "生产车间面积(m2)";

Parameter Format = "N..8,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(SCALE = 2);

Storage Default
{
<Data name="DE081003100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081003100State</State>
<StreamLocation>^WS.DE.DE081003100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
