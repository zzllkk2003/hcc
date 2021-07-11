Class WS.DE.DE085003400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "药品、设备与材料";

Parameter Description = "耗材单位";

Parameter Format = "A..30";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 30, MINLEN = 0);

Storage Default
{
<Data name="DE085003400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085003400State</State>
<StreamLocation>^WS.DE.DE085003400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
