Class WS.DE.DE030007200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "健康危险因素";

Parameter Description = "吸烟时长(年)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE030007200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030007200State</State>
<StreamLocation>^WS.DE.DE030007200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
