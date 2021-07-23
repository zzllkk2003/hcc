Class WS.DE.DE041010600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "口唇外观检查结果代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.10.007";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.10.007");

Storage Default
{
<Data name="DE041010600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041010600State</State>
<StreamLocation>^WS.DE.DE041010600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
