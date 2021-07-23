Class WS.DE.DE045013200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "检查报告结果-主观提示";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE045013200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045013200State</State>
<StreamLocation>^WS.DE.DE045013200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
