Class WS.DE.DE030004500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "每周食用食物的频率类别代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:5～6次;2:3～4次;3:1～2次;";

Parameter ValueSet = "DE03.00.045.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE03.00.045.00");

Storage Default
{
<Data name="DE030004500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030004500State</State>
<StreamLocation>^WS.DE.DE030004500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
