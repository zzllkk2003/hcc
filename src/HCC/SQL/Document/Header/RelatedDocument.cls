/// 父文档信息
Class HCC.SQL.Document.Header.RelatedDocument Extends (%Persistent, %XML.Adaptor)
{

/// 文档
Relationship DocumentNo As HCC.SQL.Document.Header [ Cardinality = parent, Inverse = RelatedDocuments ];

Index DocumentNoIndex On DocumentNo;

/// 父文档标识符
Property parentDocumentId As %String [ Required, SqlFieldName = parentDocument_id ];

/// 父文档集序列号
Property setId As %String [ SqlFieldName = parentDocument_setId ];

/// 父文档版本号
Property versionNumber As %String [ SqlFieldName = parentDocument_versionNumber ];

Storage Default
{
<Data name="RelatedDocumentDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>parentDocumentId</Value>
</Value>
<Value name="3">
<Value>setId</Value>
</Value>
<Value name="4">
<Value>versionNumber</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("RelatedDocuments")</DataLocation>
<DefaultData>RelatedDocumentDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.HeaderC("RelatedDocuments")</IdLocation>
<IndexLocation>^HCC.SQL.DoEBE5.RelatedDocu8352I</IndexLocation>
<StreamLocation>^HCC.SQL.DoEBE5.RelatedDocu8352S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
