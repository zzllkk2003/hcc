Class WS.DE.DE051012700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学评估";

Parameter Description = "孕产妇健康评估异常结果描述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE051012700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051012700State</State>
<StreamLocation>^WS.DE.DE051012700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}