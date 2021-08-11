/// 抢救记录章节表
Class HCC.SQL.Document.RescueRecord Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode;

Parameter SectionName = "抢救记录章节";

Parameter SectionCodeSystemOID;

Parameter SectionCodeSystem;

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 急诊抢救记录
Property rescueRecord As WS.DE.DE060018100 [ SqlFieldName = rescue_record ];

/// 抢救开始日期时间
Property startTime As WS.DE.DE060022100 [ SqlFieldName = start_time ];

/// 抢救停止日期时间
Property endTime As WS.DE.DE060021800 [ SqlFieldName = end_time ];

/// 参加抢救人员子表
Relationship attendees As HCC.SQL.Document.RescueRecord.Attendee [ Cardinality = children, Inverse = rescueRecord ];

Storage Default
{
<Data name="RescueRecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>rescueRecord</Value>
</Value>
<Value name="3">
<Value>startTime</Value>
</Value>
<Value name="4">
<Value>endTime</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.RescueRecordD</DataLocation>
<DefaultData>RescueRecordDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.RescueRecordD</IdLocation>
<IndexLocation>^HCC.SQL.Document.RescueRecordI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.RescueRecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
