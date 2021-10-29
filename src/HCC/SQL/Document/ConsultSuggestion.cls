/// Author: QP
/// Version: 1.0
/// Date:2021/07
/// 会诊意见章节表
Class HCC.SQL.Document.ConsultSuggestion Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode;

Parameter SectionName = "会诊意见章节";

Parameter SectionCodeSystemOID;

Parameter SectionCodeSystem;

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 会诊意见
Property suggestion As WS.DE.DE060001800 [ SqlFieldName = suggestion ];

Storage Default
{
<Data name="ConsultSuggestionDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>suggestion</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.ConsultSugg293FD</DataLocation>
<DefaultData>ConsultSuggestionDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.ConsultSugg293FD</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.ConsultSugg293FI</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.ConsultSugg293FS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
