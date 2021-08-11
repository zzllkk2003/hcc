Class WS.DE.DE010001200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "标识";

Parameter Description = "系统内部标识";

Parameter Format = "N20";

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 20, MINLEN = 20);

Storage Default
{
<Data name="DE010001200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE010001200State</State>
<StreamLocation>^WS.DE.DE010001200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
