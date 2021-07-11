Class WS.DE.DE051009300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "疑似食源性异常病例(健康事件)报告卡上报原因代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.10.018";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.018");

Storage Default
{
<Data name="DE051009300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051009300State</State>
<StreamLocation>^WS.DE.DE051009300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
