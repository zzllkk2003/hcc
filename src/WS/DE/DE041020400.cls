Class WS.DE.DE041020400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "体格检查";

Parameter Description = "心律";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE041020400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041020400State</State>
<StreamLocation>^WS.DE.DE041020400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}