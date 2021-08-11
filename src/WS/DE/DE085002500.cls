Class WS.DE.DE085002500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 100, MINLEN = 0);

Parameter Category = "药品、设备与材料";

Parameter Description = "药物类型";

Parameter Format = "AN..100";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE085002500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085002500State</State>
<StreamLocation>^WS.DE.DE085002500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
