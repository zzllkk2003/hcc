Class WS.DE.DE085000100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "药品、设备与材料";

Parameter Description = "宫内节育器种类代码";

Parameter Format = "N2";

Parameter ValueSet = "CV08.50.101";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV08.50.101");

Storage Default
{
<Data name="DE085000100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085000100State</State>
<StreamLocation>^WS.DE.DE085000100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
