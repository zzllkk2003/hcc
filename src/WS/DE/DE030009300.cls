Class WS.DE.DE030009300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "职业病危害因素类别代码";

Parameter Format = "N1";

Parameter ValueSet = "CV03.00.203";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.203");

Storage Default
{
<Data name="DE030009300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030009300State</State>
<StreamLocation>^WS.DE.DE030009300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
