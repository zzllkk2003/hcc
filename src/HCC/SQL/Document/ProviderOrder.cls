/// Author: QP
/// Version: 1.0
/// Date:2021/07
/// 医嘱章节类表
Class HCC.SQL.Document.ProviderOrder Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "46209-3";

Parameter SectionName = "Provider Orders";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 医嘱条目子表
Relationship Items As HCC.SQL.Document.ProviderOrder.Item [ Cardinality = children, Inverse = ProviderOrder ];

/// 医嘱类别。用于《住院医嘱》
Property type As WS.DE.DE060028600 [ SqlFieldName = type ];

/// 医嘱内容。用于《24h内入出院记录》、《出院小结》-出院医嘱
Property dischargeOrder As WS.DE.DE060028700 [ SqlFieldName = dchg_order ];

/// 中药煎煮方法。用于《出院小结》
Property decoctMethod As WS.DE.DE085004700 [ SqlFieldName = decoct_method ];

/// 中药用药方法。用于《出院小结》
Property useMethod As WS.DE.DE060013600 [ SqlFieldName = use_method ];

Storage Default
{
<Data name="ProviderOrderDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>type</Value>
</Value>
<Value name="3">
<Value>dischargeOrder</Value>
</Value>
<Value name="4">
<Value>decoctMethod</Value>
</Value>
<Value name="5">
<Value>useMethod</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Docu70F6.ProviderOrderD</DataLocation>
<DefaultData>ProviderOrderDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Docu70F6.ProviderOrderD</IdLocation>
<IndexLocation>^HCC.SQL.Docu70F6.ProviderOrderI</IndexLocation>
<StreamLocation>^HCC.SQL.Docu70F6.ProviderOrderS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
