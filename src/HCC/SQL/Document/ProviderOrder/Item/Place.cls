/// 医嘱开立
Class HCC.SQL.Document.ProviderOrder.Item.Place Extends (%SerialObject, %XML.Adaptor, HCC.SQL.Base)
{

/// 医嘱开立日期时间
Property Time As WS.DE.DE060022000 [ SqlFieldName = time ];

/// 医嘱开立者签名
Property provider As WS.DE.DE020103900 [ SqlFieldName = provider ];

/// 医嘱开立科室
Property Dept As WS.DE.DE081002600 [ SqlFieldName = dept ];

Storage Default
{
<Data name="PlaceState">
<Value name="1">
<Value>Time</Value>
</Value>
<Value name="2">
<Value>provider</Value>
</Value>
<Value name="3">
<Value>Dept</Value>
</Value>
</Data>
<State>PlaceState</State>
<StreamLocation>^HCC.SQL.Document.Pro34E7.PlaceS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
