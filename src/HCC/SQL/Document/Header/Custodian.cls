/// 文档管理机构信息
Class HCC.SQL.Document.Header.Custodian Extends (%SerialObject, %XML.Adaptor, HCC.SQL.Base)
{

/// 文档保管的医疗机构标识
Property organizationId As %String [ Required, SqlFieldName = org_id ];

/// 保管机构名称
Property organizationName As %String [ Required, SqlFieldName = org_name ];

/// 保管机构地址
Property organizationAddr As %String [ Required, SqlFieldName = org_addr ];

/// 保管机构电话
Property organizationTel As %String [ Required, SqlFieldName = org_tel ];

Storage Default
{
<Data name="CustodianState">
<Value name="1">
<Value>organizationId</Value>
</Value>
<Value name="2">
<Value>organizationName</Value>
</Value>
<Value name="3">
<Value>organizationAddr</Value>
</Value>
<Value name="4">
<Value>organizationTel</Value>
</Value>
</Data>
<State>CustodianState</State>
<StreamLocation>^HCC.SQL.DocumentEBE5.CustodianS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
