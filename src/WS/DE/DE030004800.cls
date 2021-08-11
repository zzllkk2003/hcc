Class WS.DE.DE030004800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.404");

Parameter Category = "健康危险因素";

Parameter Description = "配偶/固定性伴感染状况代码";

Parameter Format = "N1";

Parameter ValueSet = "CV03.00.404";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE030004800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030004800State</State>
<StreamLocation>^WS.DE.DE030004800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
