Class WS.DE.DE030005400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "日饮酒量(两)";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Storage Default
{
<Data name="DE030005400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030005400State</State>
<StreamLocation>^WS.DE.DE030005400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
