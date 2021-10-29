/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 护理标志章节表
Class HCC.SQL.Document.NursingSign Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode;

Parameter SectionName = "护理标志";

Parameter SectionCodeSystemOID;

Parameter SectionCodeSystem;

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 呕吐标志
Property vomit As WS.DE.DE040104800 [ SqlFieldName = vomit ];

/// 排尿困难标志
Property dysuria As WS.DE.DE040105100 [ SqlFieldName = dysuria ];

Storage Default
{
<Data name="NursingSignDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>vomit</Value>
</Value>
<Value name="3">
<Value>dysuria</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.NursingSignD</DataLocation>
<DefaultData>NursingSignDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.NursingSignD</IdLocation>
<IndexLocation>^HCC.SQL.Document.NursingSignI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.NursingSignS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
