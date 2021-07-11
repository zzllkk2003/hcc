Class WS.DE.DE045004800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "尿常规镜检结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE045004800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045004800State</State>
<StreamLocation>^WS.DE.DE045004800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
