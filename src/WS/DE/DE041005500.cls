Class WS.DE.DE041005500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "体格检查";

Parameter Description = "肝大描述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE041005500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041005500State</State>
<StreamLocation>^WS.DE.DE041005500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
