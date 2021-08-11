Class WS.DE.DE050101400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "多胎类型代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:同卵;2:异卵;9:其他;";

Parameter ValueSet = "DE05.01.014.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.01.014.00");

Storage Default
{
<Data name="DE050101400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050101400State</State>
<StreamLocation>^WS.DE.DE050101400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
