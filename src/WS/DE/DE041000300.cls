Class WS.DE.DE041000300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "鼻部检查结果";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE041000300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041000300State</State>
<StreamLocation>^WS.DE.DE041000300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
