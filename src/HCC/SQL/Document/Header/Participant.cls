/// 互联互通文档头-联系人子表
Class HCC.SQL.Document.Header.Participant Extends (%Persistent, %XML.Adaptor)
{

/// 文档编号 (同时作为Idkey)
Relationship DocumentNo As HCC.SQL.Document.Header [ Cardinality = parent, Inverse = Participants ];

Index DocumentNoIndex On DocumentNo;

/// 患者与联系人关系
Property associatedEntityCode As WS.DE.DE021002400 [ Required, SqlFieldName = assocEnty_code ];

/// 联系人地址
Property addr As HCC.SQL.Addr;

/// 联系人电话号码
Property telcom As WS.DE.DE020101000 [ SqlFieldName = telcom ];

/// 联系人姓名
Property associatedPersonName As WS.DE.DE020103900 [ SqlFieldName = assocPers_name ];

Storage Default
{
<Data name="ParticipantDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>associatedEntityCode</Value>
</Value>
<Value name="3">
<Value>addr</Value>
</Value>
<Value name="4">
<Value>telcom</Value>
</Value>
<Value name="5">
<Value>associatedPersonName</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Participants")</DataLocation>
<DefaultData>ParticipantDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.HeaderC("Participants")</IdLocation>
<IndexLocation>^HCC.SQL.DocumeEBE5.ParticipantI</IndexLocation>
<StreamLocation>^HCC.SQL.DocumeEBE5.ParticipantS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}