/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 分娩评估章节表
Class HCC.SQL.Document.DeliveryAssessment Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "X-ASSESS";

Parameter SectionName = "ASSESSMENTS";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// Apgar评分间隔时间代码                                                  
Property ApgarInterval As WS.DE.DE060021500 [ Required, SqlFieldName = Apgar_interval ];

/// Apgar评分值                                                       
Property Apgar As WS.DE.DE051000100 [ Required, SqlFieldName = Apgar ];

/// 分娩结局代码                                                         
Property result As WS.DE.DE060002600 [ Required, SqlFieldName = result ];

/// 新生儿异常情况代码                                                      
Property abnormal As WS.DE.DE051016000 [ Required, SqlFieldName = abnormal ];

Storage Default
{
<Data name="DeliveryAssessmentDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ApgarInterval</Value>
</Value>
<Value name="3">
<Value>Apgar</Value>
</Value>
<Value name="4">
<Value>result</Value>
</Value>
<Value name="5">
<Value>abnormal</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.DeliveryAss7753D</DataLocation>
<DefaultData>DeliveryAssessmentDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.DeliveryAss7753D</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.DeliveryAss7753I</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.DeliveryAss7753S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
