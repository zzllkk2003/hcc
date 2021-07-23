/// 联系人
Class HCC.SQL.Document.Header.Participant Extends (%Persistent, %XML.Adaptor)
{

/// 文档
Relationship DocumentNo As HCC.SQL.Document.Header [ Cardinality = parent, Inverse = Participants ];

Index DocumentNoIndex On DocumentNo;

/// 患者与联系人关系
Property associatedEntityCode As WS.DE.DE021002400 [ Required, SqlFieldName = associatedEntity_code ];

/// 联系人地址-门牌号
Property addrHouseNumber As WS.DE.DE020100906 [ SqlFieldName = addr_houseNumber ];

/// 联系人地址-村（街、路、弄等）
Property addrStreetName As WS.DE.DE020100905 [ SqlFieldName = addr_streetName ];

/// 联系人地址-乡（镇、街道办事处）
Property addrTownship As WS.DE.DE020100904 [ SqlFieldName = addr_township ];

/// 联系人地址-县（区）
Property addrCounty As WS.DE.DE020100903 [ SqlFieldName = addr_county ];

/// 联系人地址-市（地区、州）
Property addrCity As WS.DE.DE020100902 [ SqlFieldName = addr_city ];

/// 联系人地址-省（自治区、直辖市）
Property addrState As WS.DE.DE020100901 [ SqlFieldName = addr_state ];

/// 联系人地址-邮政编码
Property addrPostalCode As WS.DE.DE020104700 [ SqlFieldName = addr_postalCode ];

/// 联系人电话号码
Property telcom As WS.DE.DE020101000 [ SqlFieldName = telcom ];

/// 联系人姓名
Property asociatedPersonName As WS.DE.DE020103900 [ SqlFieldName = asociatedPerson_name ];

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
<Value>addrHouseNumber</Value>
</Value>
<Value name="4">
<Value>addrStreetName</Value>
</Value>
<Value name="5">
<Value>addrTownship</Value>
</Value>
<Value name="6">
<Value>addrCounty</Value>
</Value>
<Value name="7">
<Value>addrCity</Value>
</Value>
<Value name="8">
<Value>addrState</Value>
</Value>
<Value name="9">
<Value>addrPostalCode</Value>
</Value>
<Value name="10">
<Value>telcom</Value>
</Value>
<Value name="11">
<Value>asociatedPersonName</Value>
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
