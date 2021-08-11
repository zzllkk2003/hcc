Class WS.DE.DE030004400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "每月食用食物的频率类别代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:3次;2:2次;3:1次;";

Parameter ValueSet = "DE03.00.044.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE03.00.044.00");

Storage Default
{
<Data name="DE030004400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030004400State</State>
<StreamLocation>^WS.DE.DE030004400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
