Class WS.DE.DE060030400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "治疗类别代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "2:中西医;3:西医;11:中医;12:民族医;";

Parameter ValueSet = "DE06.00.304.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.304.00");

Storage Default
{
<Data name="DE060030400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060030400State</State>
<StreamLocation>^WS.DE.DE060030400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
