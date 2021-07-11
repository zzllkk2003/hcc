Class WS.DE.DE030006400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "健康危险因素";

Parameter Description = "停止吸食非卷烟时长(d)";

Parameter Format = "N..5";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99999, MINVAL = 0);

Storage Default
{
<Data name="DE030006400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE030006400State</State>
<StreamLocation>^WS.DE.DE030006400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
