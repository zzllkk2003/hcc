Class WS.DE.DE030003800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "劳作情况代码";

Parameter Format = "N1";

Parameter ValueSet = "1:一般;2:疲劳;3:过度疲劳;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE03.00.038.00");

Storage Default
{
<Data name="DE030003800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030003800State</State>
<StreamLocation>^WS.DE.DE030003800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
