/// 医嘱核对
Class HCC.SQL.Document.ProviderOrder.Item.Verify Extends (%SerialObject, %XML.Adaptor, HCC.SQL.Base)
{

/// 医嘱核对日期时间
Property Time As WS.DE.DE060020500 [ SqlFieldName = time ];

/// 医嘱核对者签名
Property provider As WS.DE.DE020103900 [ SqlFieldName = provider ];

Storage Default
{
<Data name="VerifyState">
<Value name="1">
<Value>Time</Value>
</Value>
<Value name="2">
<Value>provider</Value>
</Value>
</Data>
<State>VerifyState</State>
<StreamLocation>^HCC.SQL.Document.Pr34E7.VerifyS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
