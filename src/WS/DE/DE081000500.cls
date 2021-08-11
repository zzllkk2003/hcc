Class WS.DE.DE081000500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 2);

Parameter Category = "卫生机构";

Parameter Description = "房屋建筑总面积(m2)";

Parameter Format = "N..8,2";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE081000500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081000500State</State>
<StreamLocation>^WS.DE.DE081000500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
