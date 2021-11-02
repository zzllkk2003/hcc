Class WS.DE.DE045012100 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "实验室检查";

Parameter Description = "游离三碘甲状腺原氨酸检测结果(pmol/L)";

Parameter Format = "N4,1";

Parameter ValueSet;

Parameter WSDT = "F";

Property Value As WS.DT.Decimal(SCALE = 1);

Storage Default
{
<Data name="DE045012100State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE045012100State</State>
<StreamLocation>^WS.DE.DE045012100S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
