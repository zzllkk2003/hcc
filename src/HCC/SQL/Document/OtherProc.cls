/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 其他处置章节表
/// 《检查记录》需要
Class HCC.SQL.Document.OtherProc Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode;

Parameter SectionName = "其他处置章节";

Parameter SectionCodeSystemOID;

Parameter SectionCodeSystem;

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 诊疗过程描述
Property treatmentProc As WS.DE.DE060029600 [ SqlFieldName = treat_proc ];

Storage Default
{
<Data name="OtherProcDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>treatmentProc</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.OtherProcD</DataLocation>
<DefaultData>OtherProcDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.OtherProcD</IdLocation>
<IndexLocation>^HCC.SQL.Document.OtherProcI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.OtherProcS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
