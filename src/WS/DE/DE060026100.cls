Class WS.DE.DE060026100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "受孕形式代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:自然;2:人工;9:其他;";

Parameter ValueSet = "DE06.00.261.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.261.00");

Storage Default
{
<Data name="DE060026100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060026100State</State>
<StreamLocation>^WS.DE.DE060026100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
