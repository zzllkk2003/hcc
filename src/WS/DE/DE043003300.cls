Class WS.DE.DE043003300 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "全身计数器检查结果(Bq)";

Parameter Format = "N..4";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 9999, MINVAL = 0);

Storage Default
{
<Data name="DE043003300State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043003300State</State>
<StreamLocation>^WS.DE.DE043003300S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
