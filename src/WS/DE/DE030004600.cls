Class WS.DE.DE030004600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "目标摄盐量分级代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:轻;2:中;3:重;";

Parameter ValueSet = "DE03.00.046.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE03.00.046.00");

Storage Default
{
<Data name="DE030004600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030004600State</State>
<StreamLocation>^WS.DE.DE030004600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
