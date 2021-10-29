/// Author: QP
/// Version: 1.0
/// Date:2021/07
/// 术前总结章节表
Class HCC.SQL.Document.PreoperativeSummary Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode;

Parameter SectionName = "讨论总结";

Parameter SectionCodeSystemOID;

Parameter SectionCodeSystem;

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 讨论意见
Property suggestion As WS.DE.DE060001800 [ SqlFieldName = suggestion ];

/// 讨论结论
Property conclusion As WS.DE.DE060001800 [ SqlFieldName = conclusion ];

Storage Default
{
<Data name="PreoperativeSummaryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>suggestion</Value>
</Value>
<Value name="3">
<Value>conclusion</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.PreoperativeS65D</DataLocation>
<DefaultData>PreoperativeSummaryDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.PreoperativeS65D</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.PreoperativeS65I</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.PreoperativeS65S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
