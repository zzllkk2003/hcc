Class WS.DE.DE030007900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "饮食频率分类代码";

Parameter Format = "N1";

Parameter ValueSet = "CV03.00.108";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.108");

Storage Default
{
<Data name="DE030007900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030007900State</State>
<StreamLocation>^WS.DE.DE030007900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
