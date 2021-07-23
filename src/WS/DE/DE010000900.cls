Class WS.DE.DE010000900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "标识";

Parameter Description = "健康档案编号";

Parameter Format = "N17";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 17, MINLEN = 17);

Storage Default
{
<Data name="DE010000900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE010000900State</State>
<StreamLocation>^WS.DE.DE010000900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
