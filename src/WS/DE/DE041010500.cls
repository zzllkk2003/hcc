Class WS.DE.DE041010500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV04.10.022");

Parameter Category = "体格检查";

Parameter Description = "可疑佝偻病体征代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.10.022";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE041010500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041010500State</State>
<StreamLocation>^WS.DE.DE041010500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
