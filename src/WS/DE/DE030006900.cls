Class WS.DE.DE030006900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "吸食烟草种类代码";

Parameter Format = "N1";

Parameter ValueSet = "CV03.00.103";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV03.00.103");

Storage Default
{
<Data name="DE030006900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030006900State</State>
<StreamLocation>^WS.DE.DE030006900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
