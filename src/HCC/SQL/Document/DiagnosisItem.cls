/// 西医诊断条目类
/// 用于所有西医诊断数据场景
Class HCC.SQL.Document.DiagnosisItem Extends (%SerialObject, %XML.Adaptor)
{

/// 西医诊断编码
Property code As WS.DE.DE050102400 [ SqlFieldName = code ];

/// 西医诊断名称。
Property name As WS.DE.DE050102500 [ SqlFieldName = name ];

/// 诊断日期
Property date As WS.DE.DE050105800 [ SqlFieldName = date ];

/// 诊断顺位
Property orders As WS.DE.DE050108000 [ SqlFieldName = orders ];

/// 诊断机构名称。用于《检查报告》、《检验报告》
Property diagnosisOrg As WS.DE.DE081001300 [ SqlFieldName = org ];

Storage Default
{
<Data name="DiagnosisItemState">
<Value name="1">
<Value>code</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>date</Value>
</Value>
<Value name="4">
<Value>orders</Value>
</Value>
<Value name="5">
<Value>diagnosisOrg</Value>
</Value>
</Data>
<State>DiagnosisItemState</State>
<StreamLocation>^HCC.SQL.Docu70F6.DiagnosisItemS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
