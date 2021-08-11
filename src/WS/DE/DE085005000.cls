Class WS.DE.DE085005000 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "药品、设备与材料";

Parameter Description = "中药饮片剂数";

Parameter Format = "AN..50";

Parameter ValueSet;

Parameter WSDT = "S1";

Property Value As %String(MAXLEN = 50, MINLEN = 0);

Storage Default
{
<Data name="DE085005000State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085005000State</State>
<StreamLocation>^WS.DE.DE085005000S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
