Class WS.DE.DE060030600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "特殊检查及特殊治疗项目名称";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE060030600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060030600State</State>
<StreamLocation>^WS.DE.DE060030600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
