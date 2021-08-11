Class WS.DE.DE051007000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "医学评估";

Parameter Description = "特殊情况记录";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE051007000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE051007000State</State>
<StreamLocation>^WS.DE.DE051007000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
