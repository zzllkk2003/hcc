Class WS.DE.DE090010400 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生管理";

Parameter Description = "出院诊断-主要诊断-入院病情";

Parameter Format = "N1";

/// Parameter ValueSet = "1:有明确诊断;2:临床未确定;3:情况不明;4:无法确定;";
Parameter ValueSet = "DE09.00.104.00";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE09.00.104.00");

Storage Default
{
<Data name="DE090010400State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE090010400State</State>
<StreamLocation>^WS.DE.DE090010400S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
