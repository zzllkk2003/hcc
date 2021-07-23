Class WS.DE.DE010001400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "标识";

Parameter Description = "住院号";

Parameter Format = "AN..10";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 10, MINLEN = 0);

Storage Default
{
<Data name="DE010001400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE010001400State</State>
<StreamLocation>^WS.DE.DE010001400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
