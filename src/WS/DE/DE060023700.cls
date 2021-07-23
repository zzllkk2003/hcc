Class WS.DE.DE060023700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "入院途径";

Parameter Format = "N1";

/// 1.急诊;2.门诊;3.其他医疗机构转入;9.其他;
Parameter ValueSet = "CV09.00.403";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "CV09.00.403");

Storage Default
{
<Data name="DE060023700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060023700State</State>
<StreamLocation>^WS.DE.DE060023700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
