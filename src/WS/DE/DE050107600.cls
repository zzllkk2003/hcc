Class WS.DE.DE050107600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "医学诊断";

Parameter Description = "术前合并疾病";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE050107600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050107600State</State>
<StreamLocation>^WS.DE.DE050107600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
