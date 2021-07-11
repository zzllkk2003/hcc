Class WS.DE.DE085004000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "药品、设备与材料";

Parameter Description = "输血品种代码";

Parameter Format = "AN..50";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 50, MINLEN = 0);

Storage Default
{
<Data name="DE085004000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085004000State</State>
<StreamLocation>^WS.DE.DE085004000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
