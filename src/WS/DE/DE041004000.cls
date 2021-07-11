Class WS.DE.DE041004000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "附件检查结果";

Parameter Format = "N1";

Parameter ValueSet = "CV04.10.001";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV04.10.001");

Storage Default
{
<Data name="DE041004000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041004000State</State>
<StreamLocation>^WS.DE.DE041004000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
