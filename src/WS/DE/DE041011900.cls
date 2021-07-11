Class WS.DE.DE041011900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "慢性丝虫病症状/体征部位代码";

Parameter Format = "N1";

Parameter ValueSet = "CV04.10.017";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.10.017");

Storage Default
{
<Data name="DE041011900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041011900State</State>
<StreamLocation>^WS.DE.DE041011900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
