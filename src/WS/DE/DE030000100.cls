Class WS.DE.DE030000100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "艾滋病接触史代码";

Parameter Format = "N2";

Parameter ValueSet = "CV03.00.113";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.113");

Storage Default
{
<Data name="DE030000100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030000100State</State>
<StreamLocation>^WS.DE.DE030000100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
