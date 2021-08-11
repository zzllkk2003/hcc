Class WS.DE.DE030002100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.301");

Parameter Category = "健康危险因素";

Parameter Description = "环境危险因素暴露代码";

Parameter Format = "N1";

Parameter ValueSet = "CV03.00.301";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE030002100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030002100State</State>
<StreamLocation>^WS.DE.DE030002100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
