Class WS.DE.DE041013500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "皮下脂肪异常详述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE041013500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041013500State</State>
<StreamLocation>^WS.DE.DE041013500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
