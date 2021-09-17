/// Author: QP
/// Version: 1.0
/// Date:2021/07
/// 会诊原因章节表
Class HCC.SQL.Document.ConsultReason Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode;

Parameter SectionName = "会诊原因章节";

Parameter SectionCodeSystemOID;

Parameter SectionCodeSystem;

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 会诊类型
Property type As WS.DE.DE060031900 [ SqlFieldName = type ];

/// 会诊原因
Property reason As WS.DE.DE060003900 [ SqlFieldName = reason ];

Storage Default
{
<Data name="ConsultReasonDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>type</Value>
</Value>
<Value name="3">
<Value>reason</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Docu70F6.ConsultReasonD</DataLocation>
<DefaultData>ConsultReasonDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Docu70F6.ConsultReasonD</IdLocation>
<IndexLocation>^HCC.SQL.Docu70F6.ConsultReasonI</IndexLocation>
<StreamLocation>^HCC.SQL.Docu70F6.ConsultReasonS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
