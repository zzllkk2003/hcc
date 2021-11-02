Class WS.DE.DE081002400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "开办资金金额数(万元)";

Parameter Format = "N6,2";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(SCALE = 2);

Storage Default
{
<Data name="DE081002400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081002400State</State>
<StreamLocation>^WS.DE.DE081002400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
