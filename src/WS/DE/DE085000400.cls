Class WS.DE.DE085000400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV08.50.001");

Parameter Category = "药品、设备与材料";

Parameter Description = "免疫接种疫苗名称代码";

Parameter Format = "N2";

Parameter ValueSet = "CV08.50.001";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE085000400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085000400State</State>
<StreamLocation>^WS.DE.DE085000400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
