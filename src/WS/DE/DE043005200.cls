Class WS.DE.DE043005200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "临床辅助检查";

Parameter Description = "宫腔探查处理方式代码";

Parameter Format = "N1";

Parameter ValueSet = "1:药物;2:干;3:湿;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE04.30.052.00");

Storage Default
{
<Data name="DE043005200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE043005200State</State>
<StreamLocation>^WS.DE.DE043005200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
