/// 提供患者服务机构
Class HCC.SQL.Document.Header.RecordTarget.ProviderOrganization Extends (%SerialObject, %XML.Adaptor)
{

/// 提供患者服务机构id
Property providerOrganizationId As WS.DE.DE081001300 [ SqlFieldName = id ];

/// 住院机构名称
Property providerOrganizationName As %String [ SqlFieldName = name ];

Storage Default
{
<Data name="ProviderOrganizationState">
<Value name="1">
<Value>providerOrganizationId</Value>
</Value>
<Value name="2">
<Value>providerOrganizationName</Value>
</Value>
</Data>
<State>ProviderOrganizationState</State>
<StreamLocation>^HCC.SQL.DoD122.ProviderOrgBA5FS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
