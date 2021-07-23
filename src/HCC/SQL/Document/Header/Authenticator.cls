/// 医师签名信息
Class HCC.SQL.Document.Header.Authenticator Extends (%Persistent, %XML.Adaptor)
{

/// 文档
Relationship DocumentNo As HCC.SQL.Document.Header [ Cardinality = parent, Inverse = Authenticators ];

Index DocumentNoIndex On DocumentNo;

/// 签名日期时间
Property time As WS.DE.DE090005300 [ Required, SqlFieldName = time ];

/// 签名代码
Property signatureCode As %String [ Required, SqlFieldName = signature_code ];

/// 签名人指定id
Property assignedEntityId As %String [ Required, SqlFieldName = assignedEntity_id ];

/// 签名人指定code
Property assignedEntityCode As %String [ Required, SqlFieldName = assignedEntity_code ];

/// 医生姓名
Property assignedPersonName As WS.DE.DE020103900 [ Required, SqlFieldName = assignedPerson_name ];

Storage Default
{
<Data name="AuthenticatorDefaultData">
<Subscript>"1"</Subscript>
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>assignedEntityCode</Value>
</Value>
</Data>
<Data name="AuthenticatorState">
<Value name="1">
<Value>time</Value>
</Value>
<Value name="2">
<Value>signatureCode</Value>
</Value>
<Value name="3">
<Value>assignedEntityId</Value>
</Value>
<Value name="4">
<Value>assignedPersonName</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Authenticators")</DataLocation>
<DefaultData>AuthenticatorDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.HeaderC("Authenticators")</IdLocation>
<IndexLocation>^HCC.SQL.DocuEBE5.AuthenticatorI</IndexLocation>
<State>AuthenticatorState</State>
<StreamLocation>^HCC.SQL.DocuEBE5.AuthenticatorS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
