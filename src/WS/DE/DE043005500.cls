Class WS.DE.DE043005500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "脐带长度（cm）";

Parameter Format = "N..2";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As %Integer(MAXVAL = 99, MINVAL = 0);

Storage Default
{
<Data name="DE043005500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043005500State</State>
<StreamLocation>^WS.DE.DE043005500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
