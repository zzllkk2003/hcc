Class WS.DE.DE050104100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "首次诊断血吸虫病依据代码";

Parameter Format = "N1";

Parameter ValueSet = "1:血吸虫虫卵粪便检查;2:血吸虫病抗体检测;9:其他;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.01.041.00");

Storage Default
{
<Data name="DE050104100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050104100State</State>
<StreamLocation>^WS.DE.DE050104100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
