/// 费用章节
/// 耗材费
Class HCC.SQL.Document.Payment.Consumable Extends (%SerialObject, %XML.Adaptor)
{

/// 耗材-一次性医用材料费-检查用 
Property consumableExam As WS.DE.DE070001000 [ SqlFieldName = exam ];

/// 耗材-一次性医用材料费-治疗用 
Property consumableTreatment As WS.DE.DE070001000 [ SqlFieldName = treamtment ];

/// 耗材-一次性医用材料费-手术用 
Property consumableSurgery As WS.DE.DE070001000 [ SqlFieldName = surgery ];

Storage Default
{
<Data name="ConsumableState">
<Value name="1">
<Value>consumableExam</Value>
</Value>
<Value name="2">
<Value>consumableTreatment</Value>
</Value>
<Value name="3">
<Value>consumableSurgery</Value>
</Value>
</Data>
<State>ConsumableState</State>
<StreamLocation>^HCC.SQL.Documen7798.ConsumableS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
