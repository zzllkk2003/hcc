Class WS.DE.DE081005100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "租借房屋面积(m2)";

Parameter Format = "N..8,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(MAXVAL = 99999.99, MINVAL = 0, SCALE = 2);

Storage Default
{
<Data name="DE081005100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081005100State</State>
<StreamLocation>^WS.DE.DE081005100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
