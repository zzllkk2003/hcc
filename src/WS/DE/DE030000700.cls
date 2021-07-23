Class WS.DE.DE030000700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "从事有害职业时长(年)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE030000700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030000700State</State>
<StreamLocation>^WS.DE.DE030000700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
