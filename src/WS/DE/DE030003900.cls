Class WS.DE.DE030003900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 9999, MINVAL = 0);

Parameter Category = "健康危险因素";

Parameter Description = "累积受照时长(h/a)";

Parameter Format = "N..4";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE030003900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030003900State</State>
<StreamLocation>^WS.DE.DE030003900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
