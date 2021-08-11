Class WS.DE.DE030005800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.106");

Parameter Category = "健康危险因素";

Parameter Description = "食物种类代码";

Parameter Format = "N1";

Parameter ValueSet = "CV03.00.106";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE030005800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030005800State</State>
<StreamLocation>^WS.DE.DE030005800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
