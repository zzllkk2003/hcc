Class WS.DE.DE030009500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.201");

Parameter Category = "健康危险因素";

Parameter Description = "职业照射种类代码";

Parameter Format = "N1";

Parameter ValueSet = "CV03.00.201";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE030009500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030009500State</State>
<StreamLocation>^WS.DE.DE030009500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
