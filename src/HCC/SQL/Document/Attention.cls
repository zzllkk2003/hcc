/// Author: QP
/// Version: 1.0
/// Date:2021/07
/// 注意事项章节表
Class HCC.SQL.Document.Attention Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "DE09.00.119.00";

Parameter SectionName = "注意事项章节";

Parameter SectionCodeSystemOID = "2.16.156.10011.2.2.1";

Parameter SectionCodeSystem = "卫生信息数据元目录";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 手术要点。用于《术前小结》
Property surgeryKeypoint As WS.DE.DE060025400 [ SqlFieldName = surgery_keypoint ];

/// 术前准备。用于《术前小结》
Property preoperativePrep As WS.DE.DE060027100 [ SqlFieldName = preoperative_prep ];

/// 注意事项。用于《术后首次病程记录》
Property attention As WS.DE.DE090011900 [ SqlFieldName = attention ];

Storage Default
{
<Data name="AttentionDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>surgeryKeypoint</Value>
</Value>
<Value name="3">
<Value>preoperativePrep</Value>
</Value>
<Value name="4">
<Value>attention</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.AttentionD</DataLocation>
<DefaultData>AttentionDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.AttentionD</IdLocation>
<IndexLocation>^HCC.SQL.Document.AttentionI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.AttentionS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
