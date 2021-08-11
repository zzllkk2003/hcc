Class WS.DE.DE045010700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "血吸虫虫卵检查结果代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:阳性;2:阴性;3:未查;";

Parameter ValueSet = "DE04.50.107.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.50.107.00");

Storage Default
{
<Data name="DE045010700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045010700State</State>
<StreamLocation>^WS.DE.DE045010700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
