Class WS.DE.DE021003400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康史";

Parameter Description = "精神类疾病诊断名称";

Parameter Format = "AN..50";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 50, MINLEN = 0);

Storage Default
{
<Data name="DE021003400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE021003400State</State>
<StreamLocation>^WS.DE.DE021003400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
