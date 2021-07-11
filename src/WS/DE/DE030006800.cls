Class WS.DE.DE030006800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "吸食非卷烟状况";

Parameter Format = "N1";

Parameter ValueSet = "1:从不吸烟;2:过去吸，已戒烟;3:吸烟;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE03.00.068.00");

Storage Default
{
<Data name="DE030006800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030006800State</State>
<StreamLocation>^WS.DE.DE030006800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
