Class WS.DE.DE085003300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Date(FORMAT = 8);

Parameter Category = "药品、设备与材料";

Parameter Description = "开处方日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Storage Default
{
<Data name="DE085003300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085003300State</State>
<StreamLocation>^WS.DE.DE085003300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
