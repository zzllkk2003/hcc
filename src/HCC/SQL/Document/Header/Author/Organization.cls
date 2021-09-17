Class HCC.SQL.Document.Header.Author.Organization Extends (%SerialObject, %XML.Adaptor, HCC.SQL.Base)
{

/// id
Property id As WS.DE.DE081005200 [ SqlFieldName = id ];

/// 名称
Property name As WS.DE.DE081001300 [ SqlFieldName = name ];

Storage Default
{
<Data name="OrganizationState">
<Value name="1">
<Value>id</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
</Data>
<State>OrganizationState</State>
<StreamLocation>^HCC.SQL.DocumF4D8.OrganizationS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
