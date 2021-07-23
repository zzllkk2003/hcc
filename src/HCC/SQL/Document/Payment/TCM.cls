/// 费用章节
/// 中药费
Class HCC.SQL.Document.Payment.TCM Extends (%SerialObject, %XML.Adaptor)
{

/// 中药费 - 中成药费
Property TCMPatent As WS.DE.DE070001000 [ SqlFieldName = patent ];

/// 中药费 - 中草药费
Property TCMHerb As WS.DE.DE070001000 [ SqlFieldName = herb ];

Storage Default
{
<Data name="TCMState">
<Value name="1">
<Value>TCMPatent</Value>
</Value>
<Value name="2">
<Value>TCMHerb</Value>
</Value>
</Data>
<State>TCMState</State>
<StreamLocation>^HCC.SQL.Document.Payment.TCMS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
