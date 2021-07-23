Class WS.DE.DE060012500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "学生健康档案建档标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Property Value As %Boolean;

Storage Default
{
<Data name="DE060012500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060012500State</State>
<StreamLocation>^WS.DE.DE060012500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
