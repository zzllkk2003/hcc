/// 医嘱取消
Class HCC.SQL.Document.ProviderOrder.Item.Cancel Extends (%SerialObject, %XML.Adaptor)
{

/// 医嘱取消日期时间
Property Time As WS.DE.DE060023400 [ SqlFieldName = time ];

/// 医嘱取消者签名
Property provider As WS.DE.DE020103900 [ SqlFieldName = provider ];

Storage Default
{
<Data name="CancelState">
<Value name="1">
<Value>Time</Value>
</Value>
<Value name="2">
<Value>provider</Value>
</Value>
</Data>
<State>CancelState</State>
<StreamLocation>^HCC.SQL.Document.Pr34E7.CancelS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
