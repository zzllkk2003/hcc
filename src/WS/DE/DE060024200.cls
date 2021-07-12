Class WS.DE.DE060024200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "计划与干预";

Parameter Description = "宫缩剂使用方法";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE060024200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE060024200State</State>
<StreamLocation>^WS.DE.DE060024200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}