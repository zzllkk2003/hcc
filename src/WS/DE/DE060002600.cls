Class WS.DE.DE060002600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "分娩结局";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:活产;2:死胎;3:死产;";

Parameter ValueSet;

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.026.00");

Storage Default
{
<Data name="DE060002600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060002600State</State>
<StreamLocation>^WS.DE.DE060002600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
