Class WS.DE.DE030002300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.112");

Parameter Category = "健康危险因素";

Parameter Description = "患病对家庭或社会的影响代码";

Parameter Format = "N2";

Parameter ValueSet = "CV03.00.112";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE030002300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030002300State</State>
<StreamLocation>^WS.DE.DE030002300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
