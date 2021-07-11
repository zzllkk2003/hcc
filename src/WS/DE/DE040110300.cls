Class WS.DE.DE040110300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "疫苗异常反应史";

Parameter Format = "AN..1000";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 1000, MINLEN = 0);

Storage Default
{
<Data name="DE040110300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040110300State</State>
<StreamLocation>^WS.DE.DE040110300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
