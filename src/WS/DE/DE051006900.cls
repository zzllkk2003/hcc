Class WS.DE.DE051006900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "随诊检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE051006900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051006900State</State>
<StreamLocation>^WS.DE.DE051006900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
