Class WS.DE.DE051007700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "危险性分级代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.10.013";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.013");

Storage Default
{
<Data name="DE051007700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051007700State</State>
<StreamLocation>^WS.DE.DE051007700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
