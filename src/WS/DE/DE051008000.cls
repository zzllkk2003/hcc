Class WS.DE.DE051008000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "现存主要健康问题代码";

Parameter Format = "AN..5";

Parameter ValueSet = "ICD-10";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "ICD-10");

Storage Default
{
<Data name="DE051008000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051008000State</State>
<StreamLocation>^WS.DE.DE051008000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
