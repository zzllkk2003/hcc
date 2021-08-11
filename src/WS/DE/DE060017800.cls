Class WS.DE.DE060017800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "安全护理代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:勤巡视病房;2:加床档;3:约束四肢;";

Parameter ValueSet = "DE06.00.178.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.178.00");

Storage Default
{
<Data name="DE060017800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060017800State</State>
<StreamLocation>^WS.DE.DE060017800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
