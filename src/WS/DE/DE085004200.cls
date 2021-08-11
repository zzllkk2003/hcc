Class WS.DE.DE085004200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 50, MINLEN = 0);

Parameter Category = "药品、设备与材料";

Parameter Description = "术中所用物品名称";

Parameter Format = "AN..50";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE085004200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085004200State</State>
<StreamLocation>^WS.DE.DE085004200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
