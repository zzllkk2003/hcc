Class WS.DE.DE051012400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "疑似食源性异常病例(健康事件)可疑病因代码";

Parameter Format = "N1";

Parameter ValueSet = "CV05.10.017";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.10.017");

Storage Default
{
<Data name="DE051012400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051012400State</State>
<StreamLocation>^WS.DE.DE051012400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
