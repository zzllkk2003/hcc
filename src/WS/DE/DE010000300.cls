Class WS.DE.DE010000300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "标识";

Parameter Description = "标本编号";

Parameter Format = "AN..20";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 20, MINLEN = 0);

Storage Default
{
<Data name="DE010000300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE010000300State</State>
<StreamLocation>^WS.DE.DE010000300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}