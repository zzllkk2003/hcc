/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 知情同意章节表
Class HCC.SQL.Document.Consent Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode = "34895-3";

Parameter SectionName = "EDUCATION NOTE";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 病情概括及主要抢救措施
Property notes As WS.DE.DE060018300 [ SqlFieldName = notes ];

/// 病危（重）通知内容
Property crisisContent As WS.DE.DE060027800 [ SqlFieldName = crisis_content ];

/// 通知时间
Property time As WS.DE.DE060022100 [ SqlFieldName = time ];

/// 知情同意书名称。用于《其他知情同意书》
Property title As WS.DE.DE090011700 [ SqlFieldName = title ];

/// 知情同意内容。用于《其他知情同意书》
Property content As WS.DE.DE090011600 [ SqlFieldName = content ];

Storage Default
{
<Data name="ConsentDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>notes</Value>
</Value>
<Value name="3">
<Value>content</Value>
</Value>
<Value name="4">
<Value>time</Value>
</Value>
<Value name="5">
<Value>crisisContent</Value>
</Value>
<Value name="6">
<Value>title</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.ConsentD</DataLocation>
<DefaultData>ConsentDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.ConsentD</IdLocation>
<IndexLocation>^HCC.SQL.Document.ConsentI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.ConsentS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
