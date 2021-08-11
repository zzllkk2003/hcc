/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 一般状况检查章节表
Class HCC.SQL.Document.GeneralStatus Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "10210-3";

Parameter SectionName = "GENERAL STATUS";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 一般状况检查结果
Property result As WS.DE.DE041021900 [ SqlFieldName = result ];

Storage Default
{
<Data name="GeneralStatusDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>result</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Docu70F6.GeneralStatusD</DataLocation>
<DefaultData>GeneralStatusDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Docu70F6.GeneralStatusD</IdLocation>
<IndexLocation>^HCC.SQL.Docu70F6.GeneralStatusI</IndexLocation>
<StreamLocation>^HCC.SQL.Docu70F6.GeneralStatusS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
