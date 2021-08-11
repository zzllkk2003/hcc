/// Author: QP
/// Version: 1.0
/// Date:2021/07
/// 死亡原因章节表
Class HCC.SQL.Document.DeathReason Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode;

Parameter SectionName = "死亡原因章节";

Parameter SectionCodeSystemOID;

Parameter SectionCodeSystem;

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 死亡日期时间
Property deathTime As WS.DE.DE020103600 [ SqlFieldName = death_time ];

/// 直接死亡原因名称
Property reasonName As WS.DE.DE050102500 [ SqlFieldName = reason_name ];

/// 直接死亡原因编码。用于《死亡记录》使用此数据元
Property reasonCode As WS.DE.DE050102400 [ SqlFieldName = reason_code ];

/// 死亡诊断编码。用于《死亡病例讨论记录》使用此数据元
Property diagCode As WS.DE.DE050102100 [ SqlFieldName = diag_code ];

Storage Default
{
<Data name="DeathReasonDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>deathTime</Value>
</Value>
<Value name="3">
<Value>reasonName</Value>
</Value>
<Value name="4">
<Value>reasonCode</Value>
</Value>
<Value name="5">
<Value>diagCode</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.DeathReasonD</DataLocation>
<DefaultData>DeathReasonDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.DeathReasonD</IdLocation>
<IndexLocation>^HCC.SQL.Document.DeathReasonI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.DeathReasonS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
