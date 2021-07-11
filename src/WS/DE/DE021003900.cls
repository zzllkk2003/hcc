Class WS.DE.DE021003900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "家族疾病史代码";

Parameter Format = "N1";

/// Parameter ValueSet = "1:家族遗传性疾病史;2:家族精神疾病史;9:其他;";
Parameter ValueSet = "DE02.10.039.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE02.10.039.00");

Storage Default
{
<Data name="DE021003900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021003900State</State>
<StreamLocation>^WS.DE.DE021003900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
