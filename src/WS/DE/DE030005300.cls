Class WS.DE.DE030005300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Parameter Category = "健康危险因素";

Parameter Description = "日吸烟量(支)";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE030005300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030005300State</State>
<StreamLocation>^WS.DE.DE030005300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
