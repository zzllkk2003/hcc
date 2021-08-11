Class WS.DE.DE085002200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 50, MINLEN = 0);

Parameter Category = "药品、设备与材料";

Parameter Description = "药物名称";

Parameter Format = "AN..50";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE085002200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085002200State</State>
<StreamLocation>^WS.DE.DE085002200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
