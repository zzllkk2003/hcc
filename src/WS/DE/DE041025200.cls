Class WS.DE.DE041025200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "会阴切开位置";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE041025200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041025200State</State>
<StreamLocation>^WS.DE.DE041025200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
