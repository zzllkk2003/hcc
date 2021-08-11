/// Author: QP
/// Version: 1.0
/// Date:2021/07
/// 尸检意见章节表
Class HCC.SQL.Document.AutopsyOpinion Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode;

Parameter SectionName = "尸检意见章节";

Parameter SectionCodeSystemOID;

Parameter SectionCodeSystem;

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 家属是否同意尸体解剖标志
Property agree As WS.DE.DE090011500 [ SqlFieldName = agree ];

Storage Default
{
<Data name="AutopsyOpinionDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>agree</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Doc70F6.AutopsyOpinionD</DataLocation>
<DefaultData>AutopsyOpinionDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Doc70F6.AutopsyOpinionD</IdLocation>
<IndexLocation>^HCC.SQL.Doc70F6.AutopsyOpinionI</IndexLocation>
<StreamLocation>^HCC.SQL.Doc70F6.AutopsyOpinionS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
