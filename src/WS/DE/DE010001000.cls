Class WS.DE.DE010001000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "标识";

Parameter Description = "门诊号";

Parameter Format = "AN..18";

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 18, MINLEN = 0);

Storage Default
{
<Data name="DE010001000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE010001000State</State>
<StreamLocation>^WS.DE.DE010001000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
