Class WS.DE.DE050100800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "尘肺期别代码";

Parameter Format = "N1";

Parameter ValueSet = "1:Ⅰ期;2:Ⅱ期;3:Ⅲ期;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE05.01.008.00");

Storage Default
{
<Data name="DE050100800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050100800State</State>
<StreamLocation>^WS.DE.DE050100800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
