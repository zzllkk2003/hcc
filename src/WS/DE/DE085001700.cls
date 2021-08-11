Class WS.DE.DE085001700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 30, MINLEN = 0);

Parameter Category = "药品、设备与材料";

Parameter Description = "疫苗批号";

Parameter Format = "A..30";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE085001700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085001700State</State>
<StreamLocation>^WS.DE.DE085001700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
