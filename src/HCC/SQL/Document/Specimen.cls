/// 标本
/// 用于实验室检查章节
Class HCC.SQL.Document.Specimen Extends (%SerialObject, %XML.Adaptor)
{

/// 标本类别
Property type As WS.DE.DE045013400 [ SqlFieldName = type ];

/// 标本采样日期时间
Property collectTime As WS.DE.DE021002700 [ SqlFieldName = collect_time ];

/// 接收标本日期时间
Property receiveTime As WS.DE.DE021002700 [ SqlFieldName = receive_time ];

Storage Default
{
<Data name="SpecimenState">
<Value name="1">
<Value>type</Value>
</Value>
<Value name="2">
<Value>collectTime</Value>
</Value>
<Value name="3">
<Value>receiveTime</Value>
</Value>
</Data>
<State>SpecimenState</State>
<StreamLocation>^HCC.SQL.Document.SpecimenS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
