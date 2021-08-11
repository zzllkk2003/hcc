/// 文档创作者
Class HCC.SQL.Document.Header.Author Extends (%SerialObject, %XML.Adaptor)
{

/// 时间
Property time As WS.DT.TimeStamp [ Required, SqlFieldName = time ];

/// 作者的唯一标识
Property authorId As %String [ Required, SqlFieldName = author_id ];

/// 医疗机构组织机构标识符
Property assignedPersonId As %String [ Required, SqlFieldName = asgnPers_id ];

/// 医生姓名
Property assignedPersonName As WS.DE.DE020103900 [ Required, SqlFieldName = asgnPers_name ];

/// 建档医疗机构
/// 以下文档需要：《病历概要》
Property representedOrganization As HCC.SQL.Document.Header.Author.Organization [ SqlFieldName = represOrg ];

Storage Default
{
<Data name="AuthorState">
<Value name="1">
<Value>time</Value>
</Value>
<Value name="2">
<Value>authorId</Value>
</Value>
<Value name="3">
<Value>assignedPersonId</Value>
</Value>
<Value name="4">
<Value>assignedPersonName</Value>
</Value>
<Value name="5">
<Value>representedOrganization</Value>
</Value>
</Data>
<State>AuthorState</State>
<StreamLocation>^HCC.SQL.Document.HeEBE5.AuthorS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
