Class WS.DE.DE083001400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生人员";

Parameter Description = "人员培训时期类别代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:上岗前;2:在岗期间;3:离岗时;";

Parameter ValueSet = "DE08.30.014.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE08.30.014.00");

Storage Default
{
<Data name="DE083001400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE083001400State</State>
<StreamLocation>^WS.DE.DE083001400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
