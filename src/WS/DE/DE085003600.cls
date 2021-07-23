Class WS.DE.DE085003600 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "药品、设备与材料";

Parameter Description = "输血量计量单位";

Parameter Format = "A..30";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 30, MINLEN = 0);

Storage Default
{
<Data name="DE085003600State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085003600State</State>
<StreamLocation>^WS.DE.DE085003600S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
