Class WS.DE.DE060030500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "计划与干预";

Parameter Description = "特殊检查及特殊治疗目的";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE060030500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060030500State</State>
<StreamLocation>^WS.DE.DE060030500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
