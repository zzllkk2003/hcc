Class WS.DE.DE060019600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "初诊标志";

Parameter Format = "N1";

Parameter ValueSet = "1:初诊;2:复诊;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE06.00.196.00");

Storage Default
{
<Data name="DE060019600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060019600State</State>
<StreamLocation>^WS.DE.DE060019600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
