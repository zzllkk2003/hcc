Class WS.DE.DE060031400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "转科记录类型";

Parameter Format = "N1";

Parameter ValueSetDisplay = "1:转入记录;2:转出记录;";

Parameter ValueSet = "DE06.00.314.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.314.00");

Storage Default
{
<Data name="DE060031400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060031400State</State>
<StreamLocation>^WS.DE.DE060031400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
