/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 健康指导章节表
Class HCC.SQL.Document.HealthGuidance Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode = "69730-0";

Parameter SectionName = "Instructions";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 饮食指导代码
Property diet As WS.DE.DE060029100 [ SqlFieldName = diet ];

/// 生活方式指导
Property lifestyle As WS.DE.DE060023800 [ SqlFieldName = lifestyle ];

/// 宣教内容
Property education As WS.DE.DE0600124 [ SqlFieldName = education ];

/// 复诊指导
Property followup As WS.DE.DE060029900 [ SqlFieldName = followup ];

/// 用药指导
Property medication As WS.DE.DE060013600 [ SqlFieldName = medication ];

Storage Default
{
<Data name="HealthGuidanceDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>diet</Value>
</Value>
<Value name="3">
<Value>lifestyle</Value>
</Value>
<Value name="4">
<Value>education</Value>
</Value>
<Value name="5">
<Value>followup</Value>
</Value>
<Value name="6">
<Value>medication</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Doc70F6.HealthGuidanceD</DataLocation>
<DefaultData>HealthGuidanceDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Doc70F6.HealthGuidanceD</IdLocation>
<IndexLocation>^HCC.SQL.Doc70F6.HealthGuidanceI</IndexLocation>
<StreamLocation>^HCC.SQL.Doc70F6.HealthGuidanceS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
