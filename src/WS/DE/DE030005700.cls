Class WS.DE.DE030005700 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 9999, MINVAL = 0);

Parameter Category = "健康危险因素";

Parameter Description = "身体活动时长(min)";

Parameter Format = "N..4";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE030005700State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030005700State</State>
<StreamLocation>^WS.DE.DE030005700S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
