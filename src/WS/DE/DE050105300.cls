Class WS.DE.DE050105300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "孕产妇死亡死因分类代码";

Parameter Format = "N2";

Parameter ValueSet = "CV05.01.006";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "CV05.01.006");

Storage Default
{
<Data name="DE050105300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050105300State</State>
<StreamLocation>^WS.DE.DE050105300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
