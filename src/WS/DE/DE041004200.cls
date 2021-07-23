Class WS.DE.DE041004200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "附件异常描述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE041004200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041004200State</State>
<StreamLocation>^WS.DE.DE041004200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
