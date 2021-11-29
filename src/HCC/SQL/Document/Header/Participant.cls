/// 互联互通文档头 - 参与者子表
Class HCC.SQL.Document.Header.Participant Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

/// 文档编号 (同时作为Idkey)
Relationship DocumentNo As HCC.SQL.Document.Header [ Cardinality = parent, Inverse = Participants ];

Index DocumentNoIndex On DocumentNo;

/// 联系人地址
Property addr As HCC.SQL.Addr;

/// 联系人电话号码
Property telcom As WS.DE.DE020101000 [ SqlFieldName = telcom ];

/// 角色(ORG:origin发起人/主持人;ATND:attender参与者;NOT:ugent notification contact紧急联系人;CON:consultant顾问;PRCP:primary information recipient主要信息接收人;PRF:performer执行人)
Property typeCode As %String(VALUELIST = ",ORG,ATND,NOT,CON,PRCP,PRF") [ InitialExpression = "NOT", SqlFieldName = type_code ];

/// 联系人姓名
Property associatedPersonName As WS.DE.DE020103900 [ SqlFieldName = assocPers_name ];

/// 参与科室。《检查记录》、《检验记录》需要
Property scopingOrganization As HCC.SQL.Document.Header.Participant.ScopingOrg [ SqlFieldName = scop_org ];

/*
/// 患者与联系人关系
Property associatedEntityCode As WS.DE.DE021002400 [ SqlFieldName = assocEnty_code ];
*/
Storage Default
{
<Data name="ParticipantDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>addr</Value>
</Value>
<Value name="3">
<Value>telcom</Value>
</Value>
<Value name="4">
<Value>typeCode</Value>
</Value>
<Value name="5">
<Value>associatedPersonName</Value>
</Value>
<Value name="6">
<Value>scopingOrganization</Value>
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
