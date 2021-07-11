Class WS.DE.DE030000500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "厕所类别代码";

Parameter Format = "N1";

Parameter ValueSet = "CV03.00.304";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.304");

Storage Default
{
<Data name="DE030000500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030000500State</State>
<StreamLocation>^WS.DE.DE030000500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
