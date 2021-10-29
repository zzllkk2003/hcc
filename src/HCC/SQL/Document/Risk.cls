/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 风险章节表
Class HCC.SQL.Document.Risk Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode;

Parameter SectionName = "操作风险";

Parameter SectionCodeSystemOID;

Parameter SectionCodeSystem;

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 手术中可能出现的意外及风险
Property operationRisk As WS.DE.DE051016200 [ SqlFieldName = operation_risk ];

/// 手术后可能出现的意外以及风险
Property postOperationRisk As WS.DE.DE050107500 [ SqlFieldName = post_operation_risk ];

Storage Default
{
<Data name="RiskDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>operationRisk</Value>
</Value>
<Value name="3">
<Value>postOperationRisk</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.RiskD</DataLocation>
<DefaultData>RiskDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.RiskD</IdLocation>
<IndexLocation>^HCC.SQL.Document.RiskI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.RiskS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
