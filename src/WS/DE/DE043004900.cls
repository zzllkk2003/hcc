Class WS.DE.DE043004900 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Parameter Category = "临床辅助检查";

Parameter Description = "1秒钟用力呼气量/最大肺活量百分比(%)";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE043004900State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043004900State</State>
<StreamLocation>^WS.DE.DE043004900S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
