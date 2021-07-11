/// 费用章节
/// 治疗费 - 手术治疗项目费- 详细
Class HCC.SQL.Document.Payment.Surgery.Detail Extends (%SerialObject, %XML.Adaptor)
{

/// 治疗-手术治疗费-麻醉费
Property anesthesia As WS.DE.DE070001000 [ SqlFieldName = anesthesia ];

/// 治疗-手术治疗费-手术费
Property surgery As WS.DE.DE070001000 [ SqlFieldName = surgery ];

Storage Default
{
<Data name="DetailState">
<Value name="1">
<Value>anesthesia</Value>
</Value>
<Value name="2">
<Value>surgery</Value>
</Value>
</Data>
<State>DetailState</State>
<StreamLocation>^HCC.SQL.Document.Pa1B36.DetailS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
