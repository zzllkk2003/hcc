Class WS.DE.DE060012000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV06.00.217");

Parameter Category = "计划与干预";

Parameter Description = "新生儿访视健康指导类别代码";

Parameter Format = "N1";

Parameter ValueSet = "CV06.00.217";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE060012000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060012000State</State>
<StreamLocation>^WS.DE.DE060012000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
