Class WS.DE.DE043001500 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "检查/检验定量结果";

Parameter Format = "N..14,4";

Parameter ValueSet;

Parameter WSDT = "N";

Property Value As WS.DT.Decimal(MAXVAL = 999999999.9999, MINVAL = 0, SCALE = 4);

Storage Default
{
<Data name="DE043001500State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043001500State</State>
<StreamLocation>^WS.DE.DE043001500S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
