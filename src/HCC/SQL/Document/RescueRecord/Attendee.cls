/// 抢救记录章节- 参加抢救人员子表
Class HCC.SQL.Document.RescueRecord.Attendee Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

/// 参加抢救人员
Property attendee As WS.DE.DE083003200 [ SqlFieldName = attendee ];

/// 专业技术职务类别代码
Property specialtyLevel As WS.DE.DE083003100 [ SqlFieldName = specialty_level ];

/// 文档编号
Relationship rescueRecord As HCC.SQL.Document.RescueRecord [ Cardinality = parent, Inverse = attendees, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="AttendeeDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>attendee</Value>
</Value>
<Value name="3">
<Value>specialtyLevel</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("attendees")</DataLocation>
<DefaultData>AttendeeDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.RescueRecordC("attendees")</IdLocation>
<IndexLocation>^HCC.SQL.Document.RF41.AttendeeI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.RF41.AttendeeS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
