Class WS.DE.DE030005100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "日供水数量";

Parameter Format = "N..8";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99999999, MINVAL = 0);

Storage Default
{
<Data name="DE030005100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030005100State</State>
<StreamLocation>^WS.DE.DE030005100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
