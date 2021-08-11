Class WS.DE.DE010001900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "标识";

Parameter Description = "病房号";

Parameter Format = "AN..20";

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 20, MINLEN = 0);

Storage Default
{
<Data name="DE010001900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE010001900State</State>
<StreamLocation>^WS.DE.DE010001900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
