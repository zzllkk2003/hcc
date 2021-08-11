/// 抢救记录
/// 用于《抢救记录》的"手术操作章节"
Class HCC.SQL.Document.Rescue Extends (%SerialObject, %XML.Adaptor)
{

Parameter SectionCode;

Parameter SectionName = "抢救记录章节";

Parameter SectionCodeSystemOID;

Parameter SectionCodeSystem;

/// 抢救措施
Property name As WS.DE.DE060009400 [ SqlFieldName = name ];

/// 抢救开始日期时间
Property begin As WS.DE.DE060022100 [ SqlFieldName = begin ];

/// 抢救结束日期时间
Property end As WS.DE.DE060021800 [ SqlFieldName = end ];

Storage Default
{
<Data name="RescueState">
<Value name="1">
<Value>name</Value>
</Value>
<Value name="2">
<Value>begin</Value>
</Value>
<Value name="3">
<Value>end</Value>
</Value>
</Data>
<State>RescueState</State>
<StreamLocation>^HCC.SQL.Document.RescueS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
