Class WS.DE.DE085001000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "药品、设备与材料";

Parameter Description = "药敏试验所用药物代码";

Parameter Format = "N1";

Parameter ValueSet = "CV08.50.003";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV08.50.003");

Storage Default
{
<Data name="DE085001000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085001000State</State>
<StreamLocation>^WS.DE.DE085001000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
