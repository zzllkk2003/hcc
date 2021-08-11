Class WS.DE.DE050105400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "孕妇高危妊娠级别代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:轻度;2:中度;3:重度;";

Parameter ValueSet = "DE05.01.054.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.01.054.00");

Storage Default
{
<Data name="DE050105400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050105400State</State>
<StreamLocation>^WS.DE.DE050105400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
