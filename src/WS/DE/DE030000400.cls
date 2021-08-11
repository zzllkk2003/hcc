Class WS.DE.DE030000400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 9999, MINVAL = 0);

Parameter Category = "健康危险因素";

Parameter Description = "步行或骑自行车累计时长(min)";

Parameter Format = "N..4";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE030000400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030000400State</State>
<StreamLocation>^WS.DE.DE030000400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
