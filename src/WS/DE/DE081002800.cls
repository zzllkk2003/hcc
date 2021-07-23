Class WS.DE.DE081002800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "年度新增固定资产金额(万元)";

Parameter Format = "N..6,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As %Decimal(SCALE = 2);

Storage Default
{
<Data name="DE081002800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081002800State</State>
<StreamLocation>^WS.DE.DE081002800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
