Class WS.DE.DE081004300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "银行贷款及其他借款金额(万元)";

Parameter Format = "N..6,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(SCALE = 2);

Storage Default
{
<Data name="DE081004300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081004300State</State>
<StreamLocation>^WS.DE.DE081004300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
