Class WS.DE.DE041004900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "体格检查";

Parameter Description = "腹部压痛描述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE041004900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041004900State</State>
<StreamLocation>^WS.DE.DE041004900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
