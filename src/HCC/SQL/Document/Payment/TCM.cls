/// 费用章节
/// 中药费
Class HCC.SQL.Document.Payment.TCM Extends (%SerialObject, %XML.Adaptor)
{

/// 中药费-中成药费
Property patent As WS.HSDE.HDSD0011135 [ SqlFieldName = patent ];

/// 中药费-中草药费
Property herb As WS.HSDE.HDSD0011134 [ SqlFieldName = herb ];

Storage Default
{
<Data name="TCMState">
<Value name="1">
<Value>patent</Value>
</Value>
<Value name="2">
<Value>herb</Value>
</Value>
</Data>
<State>TCMState</State>
<StreamLocation>^HCC.SQL.Document.Payment.TCMS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
