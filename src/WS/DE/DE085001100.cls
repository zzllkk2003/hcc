Class WS.DE.DE085001100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "药品、设备与材料";

Parameter Description = "药物剂型代码";

Parameter Format = "N2";

Parameter ValueSet = "CV08.50.002";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV08.50.002");

Storage Default
{
<Data name="DE085001100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085001100State</State>
<StreamLocation>^WS.DE.DE085001100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
