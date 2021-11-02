Class WS.DE.DE081005000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "自有房屋面积(m2)";

Parameter Format = "N..8,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(SCALE = 2);

Storage Default
{
<Data name="DE081005000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081005000State</State>
<StreamLocation>^WS.DE.DE081005000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
