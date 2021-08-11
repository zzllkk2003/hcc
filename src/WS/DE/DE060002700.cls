Class WS.DE.DE060002700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "服药依从性代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:规律;2:间断;3:不服药";

Parameter ValueSet = "DE06.00.027.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.027.00");

Storage Default
{
<Data name="DE060002700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060002700State</State>
<StreamLocation>^WS.DE.DE060002700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
