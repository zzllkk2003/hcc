Class WS.DE.DE030007100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "吸烟频率代码";

Parameter Format = "N1";

Parameter ValueSet = "CV03.00.101";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.101");

Storage Default
{
<Data name="DE030007100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030007100State</State>
<StreamLocation>^WS.DE.DE030007100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
