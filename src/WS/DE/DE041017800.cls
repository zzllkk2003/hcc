Class WS.DE.DE041017800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "睡眠时间描述";

Parameter Format = "AN..20";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 20, MINLEN = 0);

Storage Default
{
<Data name="DE041017800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041017800State</State>
<StreamLocation>^WS.DE.DE041017800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
