Class WS.DE.DE030006300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.202");

Parameter Category = "健康危险因素";

Parameter Description = "受照原因代码";

Parameter Format = "N1";

Parameter ValueSet = "CV03.00.202";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE030006300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030006300State</State>
<StreamLocation>^WS.DE.DE030006300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
