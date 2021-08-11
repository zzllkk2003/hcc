Class WS.DE.DE030005600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "摄盐量分级代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:轻;2:中;3:重;";

Parameter ValueSet = "DE03.00.056.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE03.00.056.00");

Storage Default
{
<Data name="DE030005600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030005600State</State>
<StreamLocation>^WS.DE.DE030005600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
