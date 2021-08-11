Class WS.DE.DE043003100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Property Value As %Integer(MAXVAL = 1000000000000000000000000000000, MINVAL = 0);

Parameter Category = "临床辅助检查";

Parameter Description = "鞘膜积液测量值(cm)";

Parameter Format = "N..30";

Parameter ValueSet;

Parameter WSDT = "N";

Storage Default
{
<Data name="DE043003100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043003100State</State>
<StreamLocation>^WS.DE.DE043003100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
