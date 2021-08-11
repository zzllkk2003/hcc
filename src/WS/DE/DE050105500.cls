Class WS.DE.DE050105500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "医学诊断";

Parameter Description = "诊断方法描述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE050105500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050105500State</State>
<StreamLocation>^WS.DE.DE050105500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
