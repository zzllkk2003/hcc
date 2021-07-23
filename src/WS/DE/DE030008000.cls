Class WS.DE.DE030008000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "饮食情况代码";

Parameter Format = "N1";

Parameter ValueSet = "1:良好;2:一般;3:较差;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE03.00.080.00");

Storage Default
{
<Data name="DE030008000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030008000State</State>
<StreamLocation>^WS.DE.DE030008000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
