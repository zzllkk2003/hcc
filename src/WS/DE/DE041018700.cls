Class WS.DE.DE041018700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "体格检查";

Parameter Description = "体征描述";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Storage Default
{
<Data name="DE041018700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE041018700State</State>
<StreamLocation>^WS.DE.DE041018700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}