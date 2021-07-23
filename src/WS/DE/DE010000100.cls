Class WS.DE.DE010000100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "标识";

Parameter Description = "报告卡编码";

Parameter Format = "AN..20";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 20, MINLEN = 0);

Storage Default
{
<Data name="DE010000100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE010000100State</State>
<StreamLocation>^WS.DE.DE010000100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
