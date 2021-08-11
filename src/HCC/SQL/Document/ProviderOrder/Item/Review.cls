/// 医嘱审核
Class HCC.SQL.Document.ProviderOrder.Item.Review Extends (%SerialObject, %XML.Adaptor)
{

/// 医嘱审核日期时间
Property Time As WS.DE.DE090008800 [ SqlFieldName = time ];

/// 医嘱审核者签名
Property provider As WS.DE.DE020103900 [ SqlFieldName = provider ];

Storage Default
{
<Data name="ReviewState">
<Value name="1">
<Value>Time</Value>
</Value>
<Value name="2">
<Value>provider</Value>
</Value>
</Data>
<State>ReviewState</State>
<StreamLocation>^HCC.SQL.Document.Pr34E7.ReviewS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
