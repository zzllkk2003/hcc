Class WS.DE.DE041013400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "皮下脂肪异常代码";

Parameter Format = "N1";

Parameter ValueSet = "1:无;2:有;3:不详";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.10.134.00");

Storage Default
{
<Data name="DE041013400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041013400State</State>
<StreamLocation>^WS.DE.DE041013400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
