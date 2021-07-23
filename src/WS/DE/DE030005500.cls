Class WS.DE.DE030005500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "日主食量(g)";

Parameter Format = "N..4";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 9999, MINVAL = 0);

Storage Default
{
<Data name="DE030005500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030005500State</State>
<StreamLocation>^WS.DE.DE030005500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
