Class WS.DE.DE021009100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "住院情况代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:从未住院;2:目前正在住院;3:既往住院，现未住院;";

Parameter ValueSet = "DE02.10.091.00";

Parameter WSDT = "S3";

Property Value As WS.DT.CodedString(ValueSet = "DE02.10.091.00");

Storage Default
{
<Data name="DE021009100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021009100State</State>
<StreamLocation>^WS.DE.DE021009100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
