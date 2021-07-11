Class WS.DE.DE081002700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "年度实际完成投资金额(万元)";

Parameter Format = "N..6,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As %Decimal(SCALE = 2);

Storage Default
{
<Data name="DE081002700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081002700State</State>
<StreamLocation>^WS.DE.DE081002700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
