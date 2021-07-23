Class WS.DE.DE010000400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "标识";

Parameter Description = "病案号";

Parameter Format = "AN..18";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 18, MINLEN = 0);

Storage Default
{
<Data name="DE010000400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE010000400State</State>
<StreamLocation>^WS.DE.DE010000400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
