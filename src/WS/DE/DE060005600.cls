Class WS.DE.DE060005600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "治疗情况分类代码";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:初治;2:复治";

Parameter ValueSet = "DE06.00.056.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.056.00");

Storage Default
{
<Data name="DE060005600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060005600State</State>
<StreamLocation>^WS.DE.DE060005600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
