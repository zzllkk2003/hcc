Class WS.DE.DE050106400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "医学诊断";

Parameter Description = "职业性放射性疾病代码";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE050106400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050106400State</State>
<StreamLocation>^WS.DE.DE050106400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
