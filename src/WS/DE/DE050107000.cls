Class WS.DE.DE050107000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.027");

Parameter Category = "医学诊断";

Parameter Description = "肿瘤诊断依据代码";

Parameter Format = "N2";

Parameter ValueSet = "CV05.01.027";

Parameter WSDT = "S3";

Storage Default
{
<Data name="DE050107000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050107000State</State>
<StreamLocation>^WS.DE.DE050107000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
