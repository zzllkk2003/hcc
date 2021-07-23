Class WS.DE.DE081001200 Extends WS.DE.Base [ Language = objectscript, Not ProcedureBlock ]
{

Parameter Category = "卫生机构";

Parameter Description = "机构分类管理类别代码";

Parameter Format = "N1";

Parameter ValueSet = "1:非盈利性医疗机构;2:盈利性医疗机构;9:其他;";

Parameter WSDT = "S2";

Property Value As WS.DT.CodedString(ValueSet = "DE08.10.012.00");

Storage Default
{
<Data name="DE081001200State">
<Value name="1">
<Value>Value</Value>
</Value>
</Data>
<State>DE081001200State</State>
<StreamLocation>^WS.DE.DE081001200S</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
