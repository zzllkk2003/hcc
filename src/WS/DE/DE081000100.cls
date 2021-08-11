Class WS.DE.DE081000100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 2);

Parameter Category = "卫生机构";

Parameter Description = "办公用房面积(m2)";

Parameter Format = "N..8,2";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE081000100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081000100State</State>
<StreamLocation>^WS.DE.DE081000100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
