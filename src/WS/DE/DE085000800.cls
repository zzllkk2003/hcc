Class WS.DE.DE085000800 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "药品、设备与材料";

Parameter Description = "消毒产品种类";

Parameter Format = "AN..50";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 50, MINLEN = 0);

Storage Default
{
<Data name="DE085000800State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085000800State</State>
<StreamLocation>^WS.DE.DE085000800S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
