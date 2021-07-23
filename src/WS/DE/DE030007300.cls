Class WS.DE.DE030007300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "吸烟状况代码";

Parameter Format = "N1";

Parameter ValueSet = "1:从不吸烟;2:过去吸，已戒烟;3:吸烟;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE03.00.073.00");

Storage Default
{
<Data name="DE030007300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030007300State</State>
<StreamLocation>^WS.DE.DE030007300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
