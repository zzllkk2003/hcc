/// 中医诊断条目类
/// 用于所有中医诊断数据场景
Class HCC.SQL.Document.TCMDiagItem Extends (%SerialObject, %XML.Adaptor)
{

/// 中医病名名称
Property name As WS.DE.DE051017200 [ SqlFieldName = name ];

/// 中医诊断编码
Property code As WS.DE.DE051013000 [ SqlFieldName = code ];

/// 诊断日期
Property date As WS.DE.DE050105800 [ SqlFieldName = date ];

/// 诊断顺位
Property orders As WS.DE.DE050108000 [ SqlFieldName = orders ];

Storage Default
{
<Data name="TCMDiagItemState">
<Value name="1">
<Value>name</Value>
</Value>
<Value name="2">
<Value>code</Value>
</Value>
<Value name="3">
<Value>syndromeName</Value>
</Value>
<Value name="4">
<Value>syndromeCode</Value>
</Value>
<Value name="5">
<Value>date</Value>
</Value>
<Value name="6">
<Value>orders</Value>
</Value>
</Data>
<State>TCMDiagItemState</State>
<StreamLocation>^HCC.SQL.Document.TCMDiagItemS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
