Class WS.DE.DE050102500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "医学诊断";

Parameter Description = "疾病诊断名称";

Parameter Format = "AN..50";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 50, MINLEN = 0);

Storage Default
{
<Data name="DE050102500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050102500State</State>
<StreamLocation>^WS.DE.DE050102500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
