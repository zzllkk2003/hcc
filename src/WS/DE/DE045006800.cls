Class WS.DE.DE045006800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "皮肤毛发检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE045006800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045006800State</State>
<StreamLocation>^WS.DE.DE045006800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
