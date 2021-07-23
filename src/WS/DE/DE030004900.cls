Class WS.DE.DE030004900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "禽畜栏类别";

Parameter Format = "N1";

Parameter ValueSet = "1:单设;2:室内;3:室外;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE03.00.049.00");

Storage Default
{
<Data name="DE030004900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030004900State</State>
<StreamLocation>^WS.DE.DE030004900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
