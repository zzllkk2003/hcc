Class WS.DE.DE085001500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %String(MAXLEN = 70, MINLEN = 0);

Parameter Category = "药品、设备与材料";

Parameter Description = "疫苗接种单位名称";

Parameter Format = "AN..70";

Parameter ValueSet;

Parameter WSDT = "S1";

Storage Default
{
<Data name="DE085001500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE085001500State</State>
<StreamLocation>^WS.DE.DE085001500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
