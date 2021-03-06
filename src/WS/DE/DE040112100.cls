/// 健康状况详细描述
Class WS.DE.DE040112100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "健康状况详细描述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE040112100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040112100State</State>
<StreamLocation>^WS.DE.DE040112100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
