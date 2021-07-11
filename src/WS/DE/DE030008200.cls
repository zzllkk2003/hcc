Class WS.DE.DE030008200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "饮水类别代码";

Parameter Format = "N1";

Parameter ValueSet = "CV03.00.115";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.115");

Storage Default
{
<Data name="DE030008200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030008200State</State>
<StreamLocation>^WS.DE.DE030008200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
