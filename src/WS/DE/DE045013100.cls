Class WS.DE.DE045013100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "实验室检查";

Parameter Description = "检查报告结果-客观所见";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE045013100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045013100State</State>
<StreamLocation>^WS.DE.DE045013100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
