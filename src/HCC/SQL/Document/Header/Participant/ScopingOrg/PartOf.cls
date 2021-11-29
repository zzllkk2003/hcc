/// 互联互通文档头 - 参与者子表/关联机构/上级机构
Class HCC.SQL.Document.Header.Participant.ScopingOrg.PartOf Extends (%SerialObject, %XML.Adaptor, HCC.SQL.Base)
{

/// 参与机构ID。《检查记录》、《检验记录》需要
Property OrgId As WS.DE.DE081005200 [ SqlFieldName = id ];

/// 参与机构名称。《检查记录》、《检验记录》需要
Property OrgName As WS.DE.DE081001300 [ SqlFieldName = name ];

Storage Default
{
<Data name="PartOfState">
<Value name="1">
<Value>OrgId</Value>
</Value>
<Value name="2">
<Value>OrgName</Value>
</Value>
</Data>
<State>PartOfState</State>
<StreamLocation>^HCC.SQL.Document.HeA64E.PartOfS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
