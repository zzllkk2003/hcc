Class WS.DE.DE050107300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "中医体质分类判定结果代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:是;2:基本是;3:倾向是;";

Parameter ValueSet = "DE05.01.073.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.01.073.00");

Storage Default
{
<Data name="DE050107300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050107300State</State>
<StreamLocation>^WS.DE.DE050107300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
