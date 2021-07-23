Class WS.DE.DE085002300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "药品、设备与材料";

Parameter Description = "药物使用次剂量";

Parameter Format = "N..5,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As %Decimal(SCALE = 2);

Storage Default
{
<Data name="DE085002300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085002300State</State>
<StreamLocation>^WS.DE.DE085002300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
