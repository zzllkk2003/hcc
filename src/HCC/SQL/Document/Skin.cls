/// Author: QP
/// Version: 1.0
/// Date:2021/07
/// 皮肤章节表
Class HCC.SQL.Document.Skin Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "29302-7";

Parameter SectionName = "INTEGUMENTARY SYSTEM";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 皮肤检查描述
Property skinCheck As WS.DE.DE041012600 [ SqlFieldName = skin_check ];

Storage Default
{
<Data name="SkinDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>skinCheck</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.SkinD</DataLocation>
<DefaultData>SkinDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.SkinD</IdLocation>
<IndexLocation>^HCC.SQL.Document.SkinI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.SkinS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
