Class WS.DE.DE030009000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "健康危险因素";

Parameter Description = "职业暴露危险因素名称";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE030009000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030009000State</State>
<StreamLocation>^WS.DE.DE030009000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
