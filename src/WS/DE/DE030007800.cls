Class WS.DE.DE030007800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.105");

Parameter Category = "健康危险因素";

Parameter Description = "饮酒种类代码";

Parameter Format = "N1";

Parameter ValueSet = "CV03.00.105";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE030007800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030007800State</State>
<StreamLocation>^WS.DE.DE030007800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
