Class WS.DE.DE030000800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "从事职业工种描述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE030000800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030000800State</State>
<StreamLocation>^WS.DE.DE030000800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
