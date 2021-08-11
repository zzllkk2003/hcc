/// 文档记录对象或健康保健对象 (患者信息)的工作单位
Class HCC.SQL.Document.Header.RecordTarget.Employer Extends (%SerialObject, %XML.Adaptor)
{

/// 工作单位名称
Property name As WS.DE.DE081000700 [ Required, SqlFieldName = name ];

/// 工作单位电话
Property telecom As WS.DE.DE020101000 [ SqlFieldName = tel ];

/// 工作单位地址
Property addr As HCC.SQL.Addr;

Storage Default
{
<Data name="EmployerState">
<Value name="1">
<Value>employerName</Value>
</Value>
<Value name="2">
<Value>addr</Value>
</Value>
<Value name="3">
<Value>name</Value>
</Value>
<Value name="4">
<Value>telecom</Value>
</Value>
</Data>
<State>EmployerState</State>
<StreamLocation>^HCC.SQL.DocumentD122.EmployerS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
