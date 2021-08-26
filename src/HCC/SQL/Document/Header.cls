/// Author: QP
/// Version: 1.0
/// Date:2021/07
/// 互联互通文档头主表
/// 
Class HCC.SQL.Document.Header Extends (%Persistent, %XML.Adaptor)
{

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 文档活动类
Property activity As HCC.SQL.Document.Header.Activity [ SqlFieldName = act ];

/// 文档记录对象或健康保健对象
Property recordTarget As HCC.SQL.Document.Header.RecordTarget [ SqlFieldName = recTgt ];

/// 文档管理机构信息
Property custodian As HCC.SQL.Document.Header.Custodian [ SqlFieldName = cstn ];

/// 文档创作者
Property author As HCC.SQL.Document.Header.Author [ SqlFieldName = auth ];

/// 医生签名信息，法定审核者条目子表
Relationship Authenticators As HCC.SQL.Document.Header.Authenticator [ Cardinality = children, Inverse = DocumentNo ];

/// 医生签名信息，法定审核者条目子表
Relationship LegalAuthenticators As HCC.SQL.Document.Header.LegalAuthenticator [ Cardinality = children, Inverse = DocumentNo ];

/// 联系人条目子表
Relationship Participants As HCC.SQL.Document.Header.Participant [ Cardinality = children, Inverse = DocumentNo ];

/// 陈述者条目子表
Relationship Informants As HCC.SQL.Document.Header.Informant [ Cardinality = children, Inverse = DocumentNo ];

/// 关联活动条目子表
Relationship RelatedDocuments As HCC.SQL.Document.Header.RelatedDocument [ Cardinality = children, Inverse = DocumentNo ];

/// 就诊场景 
Property encompassingEncounter As HCC.SQL.Document.Header.EncompassingEncounter [ SqlFieldName = ecpsEnc ];

Method SetEncounter(pDocNo)
{
    Set ..encompassingEncounter=##class(HCC.SQL.Document.Header.EncompassingEncounter).%OpenId(pDocNo)
}

Storage Default
{
<Data name="HeaderDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>activity</Value>
</Value>
<Value name="3">
<Value>recordTarget</Value>
</Value>
<Value name="4">
<Value>custodian</Value>
</Value>
<Value name="5">
<Value>author</Value>
</Value>
<Value name="6">
<Value>encompassingEncounter</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.HeaderD</DataLocation>
<DefaultData>HeaderDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.HeaderD</IdLocation>
<IndexLocation>^HCC.SQL.Document.HeaderI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.HeaderS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
