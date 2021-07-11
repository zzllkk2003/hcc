Class WS.DE.DE030005200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "日吸食非卷烟量";

Parameter Format = "N..3";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 999, MINVAL = 0);

Storage Default
{
<Data name="DE030005200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030005200State</State>
<StreamLocation>^WS.DE.DE030005200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
