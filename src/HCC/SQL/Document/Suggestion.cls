/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 意见章节表
Class HCC.SQL.Document.Suggestion Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode;

Parameter SectionName = "意见章节";

Parameter SectionCodeSystemOID;

Parameter SectionCodeSystem;

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 医疗机构意见
Property hospital As WS.DE.DE060001800 [ SqlFieldName = hospital ];

/// 患者意见
Property patient As WS.DE.DE060001800 [ SqlFieldName = patient ];

Storage Default
{
<Data name="SuggestionDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>hospital</Value>
</Value>
<Value name="3">
<Value>patient</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.SuggestionD</DataLocation>
<DefaultData>SuggestionDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.SuggestionD</IdLocation>
<IndexLocation>^HCC.SQL.Document.SuggestionI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.SuggestionS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
