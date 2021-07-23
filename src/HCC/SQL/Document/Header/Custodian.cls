/// 文档管理机构信息
Class HCC.SQL.Document.Header.Custodian Extends (%SerialObject, %XML.Adaptor)
{

/// 文档保管的医疗机构标识
Property organizationId As %String [ Required, SqlFieldName = organization_id ];

/// 保管机构名称
Property organizationName As %String [ Required, SqlFieldName = organization_name ];

Storage Default
{
<Data name="CustodianState">
<Value name="1">
<Value>organizationId</Value>
</Value>
<Value name="2">
<Value>organizationName</Value>
</Value>
</Data>
<State>CustodianState</State>
<StreamLocation>^HCC.SQL.DocumentEBE5.CustodianS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
