Class WS.DE.DE030000200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.404");

Parameter Category = "健康危险因素";

Parameter Description = "艾滋病患者亲属感染状况代码";

Parameter Format = "N1";

Parameter ValueSet = "CV03.00.404";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE030000200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030000200State</State>
<StreamLocation>^WS.DE.DE030000200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
