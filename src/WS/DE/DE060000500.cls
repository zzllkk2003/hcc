Class WS.DE.DE060000500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Boolean;

Parameter Category = "计划与干预";

Parameter Description = "避孕措施标志";

Parameter Format;

Parameter ValueSet;

Parameter WSDT = "L";

Storage Default
{
<Data name="DE060000500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060000500State</State>
<StreamLocation>^WS.DE.DE060000500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
