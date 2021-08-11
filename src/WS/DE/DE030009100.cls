Class WS.DE.DE030009100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.203");

Parameter Category = "健康危险因素";

Parameter Description = "职业暴露危险因素种类代码";

Parameter Format = "N..4";

Parameter ValueSet = "CV03.00.203";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE030009100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030009100State</State>
<StreamLocation>^WS.DE.DE030009100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
