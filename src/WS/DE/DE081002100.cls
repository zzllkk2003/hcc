Class WS.DE.DE081002100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Decimal(SCALE = 2);

Parameter Category = "卫生机构";

Parameter Description = "建设项目投资金额(万元)";

Parameter Format = "N7,2";

Parameter ValueSet;

Parameter WSDT = "F";

Storage Default
{
<Data name="DE081002100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081002100State</State>
<StreamLocation>^WS.DE.DE081002100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}