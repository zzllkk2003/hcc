Class WS.DE.DE085002600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "药品、设备与材料";

Parameter Description = "服用维生素D剂量(IU/d)";

Parameter Format = "N..5,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As %Decimal(SCALE = 2);

Storage Default
{
<Data name="DE085002600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085002600State</State>
<StreamLocation>^WS.DE.DE085002600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
