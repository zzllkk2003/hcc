Class WS.DE.DE050101300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 70, MINLEN = 0);

Parameter Category = "医学诊断";

Parameter Description = "订正诊断";

Parameter Format = "AN..70";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE050101300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE050101300State</State>
<StreamLocation>^WS.DE.DE050101300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
