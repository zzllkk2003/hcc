Class WS.DE.DE051005800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.006");

Parameter Category = "医学评估";

Parameter Description = "身高别体重评价结果代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.10.006";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE051005800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051005800State</State>
<StreamLocation>^WS.DE.DE051005800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
