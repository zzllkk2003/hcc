Class WS.DE.DE030004200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.114");

Parameter Category = "健康危险因素";

Parameter Description = "每日饮水量代码";

Parameter Format = "N1";

Parameter ValueSet = "CV03.00.114";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE030004200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030004200State</State>
<StreamLocation>^WS.DE.DE030004200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
