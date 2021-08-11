Class WS.DE.DE050105600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "医学诊断";

Parameter Description = "诊断检查项目";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE050105600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050105600State</State>
<StreamLocation>^WS.DE.DE050105600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
