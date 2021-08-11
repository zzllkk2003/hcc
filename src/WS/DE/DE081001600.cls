Class WS.DE.DE081001600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 2);

Parameter Category = "卫生机构";

Parameter Description = "机构自有资金金额(万元)";

Parameter Format = "N..6,2";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE081001600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081001600State</State>
<StreamLocation>^WS.DE.DE081001600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
