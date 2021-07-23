Class WS.DE.DE085000700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "药品、设备与材料";

Parameter Description = "手持终端设备名称";

Parameter Format = "A..30";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 30, MINLEN = 0);

Storage Default
{
<Data name="DE085000700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085000700State</State>
<StreamLocation>^WS.DE.DE085000700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
