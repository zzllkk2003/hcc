Class WS.DE.DE085004700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 50, MINLEN = 0);

Parameter Category = "药品、设备与材料";

Parameter Description = "中药饮片煎煮法";

Parameter Format = "AN..50";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE085004700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085004700State</State>
<StreamLocation>^WS.DE.DE085004700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
