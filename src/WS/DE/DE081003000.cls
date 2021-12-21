Class WS.DE.DE081003000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "批准基建项目建筑面积(m2)";

Parameter Format = "N..8,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(MAXVAL = 99999.99, MINVAL = 0, SCALE = 2);

Storage Default
{
<Data name="DE081003000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081003000State</State>
<StreamLocation>^WS.DE.DE081003000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
