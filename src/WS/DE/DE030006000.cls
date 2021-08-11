Class WS.DE.DE030006000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "受照类型代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:急性照射;2:慢性照射;";

Parameter ValueSet = "DE03.00.060.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE03.00.060.00");

Storage Default
{
<Data name="DE030006000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030006000State</State>
<StreamLocation>^WS.DE.DE030006000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
