Class WS.DE.DE030005000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.303");

Parameter Category = "健康危险因素";

Parameter Description = "燃料类型类别代码";

Parameter Format = "N1";

Parameter ValueSet = "CV03.00.303";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE030005000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030005000State</State>
<StreamLocation>^WS.DE.DE030005000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
