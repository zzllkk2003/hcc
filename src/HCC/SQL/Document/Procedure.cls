/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 手术操作章节表
/// 注意《宫剖产记录》的“手术操作章节”使用“宫剖产手术操作章节”表:HCC_SQL_Document.CaesareanProcedure
Class HCC.SQL.Document.Procedure Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode = "47519-4";

Parameter SectionName = "HISTORY OF PROCEDURES";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 手术操作条目子表
Relationship Items As HCC.SQL.Document.ProcedureItem [ Cardinality = children, Inverse = Procedure ];

/// 抢救措施。用于《抢救记录》
Property rescue As HCC.SQL.Document.Rescue [ SqlFieldName = rescue ];

/// 手术适应证。用于《术前小结》
Property indication As WS.DE.DE051015100 [ SqlFieldName = indication ];

/// 手术禁忌症。用于《术前小结》
Property contraindication As WS.DE.DE051014100 [ SqlFieldName = contraindication ];

/// 手术指征。用于《术前小结》
Property illness As WS.DE.DE060034000 [ SqlFieldName = illness ];

/// 手术要点。用于《术前讨论》
Property keypoint As WS.DE.DE060025400 [ SqlFieldName = keypoint ];

/// 术前准备。用于《术前讨论》
Property preoperativePrep As WS.DE.DE060027100 [ SqlFieldName = preoperative_prep ];

/// 手术方案。用于《术前讨论》
Property program As WS.DE.DE060030100 [ SqlFieldName = program ];

/// 注意事项。用于《术前讨论》
Property attention As WS.DE.DE090011900 [ SqlFieldName = attention ];

Storage Default
{
<Data name="ProcedureDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>rescue</Value>
</Value>
<Value name="3">
<Value>indication</Value>
</Value>
<Value name="4">
<Value>contraindication</Value>
</Value>
<Value name="5">
<Value>illness</Value>
</Value>
<Value name="6">
<Value>keypoint</Value>
</Value>
<Value name="7">
<Value>preoperativePrep</Value>
</Value>
<Value name="8">
<Value>program</Value>
</Value>
<Value name="9">
<Value>attention</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.ProcedureD</DataLocation>
<DefaultData>ProcedureDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.ProcedureD</IdLocation>
<IndexLocation>^HCC.SQL.Document.ProcedureI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.ProcedureS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
