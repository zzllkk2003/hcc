Class WS.DE.DE045014200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "实验室检查";

Parameter Description = "凝血功能检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE045014200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045014200State</State>
<StreamLocation>^WS.DE.DE045014200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
