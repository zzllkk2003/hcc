Class WS.DE.DE040108500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "主诉与症状";

Parameter Description = "小便状况记录";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE040108500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE040108500State</State>
<StreamLocation>^WS.DE.DE040108500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
