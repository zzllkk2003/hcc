Class WS.DE.DE045013000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "检验报告结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE045013000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045013000State</State>
<StreamLocation>^WS.DE.DE045013000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
