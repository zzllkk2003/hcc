/// 医嘱停止
Class HCC.SQL.Document.ProviderOrder.Item.Terminate Extends (%SerialObject, %XML.Adaptor, HCC.SQL.Base)
{

/// 医嘱停止日期时间
Property Time As WS.DE.DE060021800 [ SqlFieldName = time ];

/// 医嘱停止者签名
Property provider As WS.DE.DE020103900 [ SqlFieldName = provider ];

Storage Default
{
<Data name="TerminateState">
<Value name="1">
<Value>Time</Value>
</Value>
<Value name="2">
<Value>provider</Value>
</Value>
</Data>
<State>TerminateState</State>
<StreamLocation>^HCC.SQL.Document34E7.TerminateS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
