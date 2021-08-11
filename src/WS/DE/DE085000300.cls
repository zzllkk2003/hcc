Class WS.DE.DE085000300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV08.50.102");

Parameter Category = "药品、设备与材料";

Parameter Description = "交通工具类别代码";

Parameter Format = "N1";

Parameter ValueSet = "CV08.50.102";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE085000300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085000300State</State>
<StreamLocation>^WS.DE.DE085000300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
