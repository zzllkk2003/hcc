/// 费用章节
/// 诊断费
Class HCC.SQL.Document.Payment.Diag Extends (%SerialObject, %XML.Adaptor)
{

/// 诊断-病理诊断费
Property pathology As WS.HSDE.HDSD0011121 [ SqlFieldName = pathology ];

/// 诊断-实验室诊断费
Property lab As WS.HSDE.HDSD0011123 [ SqlFieldName = lab ];

/// 诊断-影像学诊断费
Property image As WS.HSDE.HDSD0011124 [ SqlFieldName = image ];

/// 诊断-临床诊断项目费
Property diagnosis As WS.HSDE.HDSD0011122 [ SqlFieldName = diag ];

Storage Default
{
<Data name="DiagState">
<Value name="1">
<Value>diagPathology</Value>
</Value>
<Value name="2">
<Value>diagLab</Value>
</Value>
<Value name="3">
<Value>diagImage</Value>
</Value>
<Value name="4">
<Value>diagDiagnosis</Value>
</Value>
<Value name="5">
<Value>pathology</Value>
</Value>
<Value name="6">
<Value>lab</Value>
</Value>
<Value name="7">
<Value>image</Value>
</Value>
<Value name="8">
<Value>diagnosis</Value>
</Value>
</Data>
<State>DiagState</State>
<StreamLocation>^HCC.SQL.Document.Payment.DiagS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
