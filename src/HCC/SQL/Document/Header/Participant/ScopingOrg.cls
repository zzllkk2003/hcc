/// 互联互通文档头 - 参与者子表范围机构
Class HCC.SQL.Document.Header.Participant.ScopingOrg Extends (%SerialObject, %XML.Adaptor, HCC.SQL.Base)
{

/// 参与科室组织机构代码。《检查记录》、《检验记录》需要
Property id As WS.DE.DE081002600 [ SqlFieldName = id ];

/// 参与科室名称。《检查记录》、《检验记录》需要
Property name As WS.DE.DE081002600 [ SqlFieldName = name ];

/// 上级机构。《检查记录》、《检验记录》需要
Property partOf As HCC.SQL.Document.Header.Participant.ScopingOrg.PartOf [ SqlFieldName = partOf ];

Storage Default
{
<Data name="ScopingOrgState">
<Value name="1">
<Value>id</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>partOf</Value>
</Value>
</Data>
<State>ScopingOrgState</State>
<StreamLocation>^HCC.SQL.DocumenB776.ScopingOrgS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
