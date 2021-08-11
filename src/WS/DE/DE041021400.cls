Class WS.DE.DE041021400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "咽部检查结果代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:无充血;2:充血;3:淋巴滤泡增生";

Parameter ValueSet = "DE04.10.214.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.10.214.00");

Storage Default
{
<Data name="DE041021400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041021400State</State>
<StreamLocation>^WS.DE.DE041021400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
