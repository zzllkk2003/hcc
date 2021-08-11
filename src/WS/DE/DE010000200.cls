Class WS.DE.DE010000200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "标识";

Parameter Description = "报卡类别代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:初次报告;2:订正报告;";

Parameter ValueSet = "DE01.00.002.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE01.00.002.00");

Storage Default
{
<Data name="DE010000200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE010000200State</State>
<StreamLocation>^WS.DE.DE010000200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
