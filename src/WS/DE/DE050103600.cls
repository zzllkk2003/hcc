Class WS.DE.DE050103600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.003");

Parameter Category = "医学诊断";

Parameter Description = "乳糜尿发作诱因代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.01.003";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE050103600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050103600State</State>
<StreamLocation>^WS.DE.DE050103600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
