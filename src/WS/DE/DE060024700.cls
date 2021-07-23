Class WS.DE.DE060024700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "是否实施临床路径";

Parameter Format = "N1";

Parameter ValueSet = "1:中医;2:西医;3:否;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.247.00");

Storage Default
{
<Data name="DE060024700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060024700State</State>
<StreamLocation>^WS.DE.DE060024700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
