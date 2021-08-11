Class WS.DE.DE050106800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "肿瘤学分类代码";

Parameter Format = "AN..7";

Parameter ValueSet = "ICD.O.3";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "ICD.O.3");

Storage Default
{
<Data name="DE050106800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050106800State</State>
<StreamLocation>^WS.DE.DE050106800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
