Class WS.DE.DE085002400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "药品、设备与材料";

Parameter Description = "药物使用剂量单位";

Parameter Format = "AN..6";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 6, MINLEN = 0);

Storage Default
{
<Data name="DE085002400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085002400State</State>
<StreamLocation>^WS.DE.DE085002400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
