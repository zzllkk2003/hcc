Class WS.DE.DE060004500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Date(FORMAT = 8);

Parameter Category = "计划与干预";

Parameter Description = "家庭病床撤床日期";

Parameter Format = "D8";

Parameter ValueSet;

Parameter WSDT = "D";

Storage Default
{
<Data name="DE060004500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060004500State</State>
<StreamLocation>^WS.DE.DE060004500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
