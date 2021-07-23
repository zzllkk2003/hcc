Class WS.DE.DE081000800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "后勤保障及其他用房面积(m2)";

Parameter Format = "N..8,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As %Decimal(SCALE = 2);

Storage Default
{
<Data name="DE081000800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081000800State</State>
<StreamLocation>^WS.DE.DE081000800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
