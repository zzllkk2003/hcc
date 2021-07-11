Class WS.DE.DE050100100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "5岁以下儿童死因分类代码";

Parameter Format = "N2";

Parameter ValueSet = "CV05.01.039";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.039");

Storage Default
{
<Data name="DE050100100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050100100State</State>
<StreamLocation>^WS.DE.DE050100100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
