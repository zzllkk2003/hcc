/// Author: QP
/// Version: 1.0
/// Date:2021/07
/// 健康评估章节表
Class HCC.SQL.Document.HealthAssessment Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "51848-0";

Parameter SectionName = "Assessment note";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 发育程度代码                                                  
Property growth As WS.DE.DE051002200 [ SqlFieldName = growth ];

/// Apgar评分值                                                       
Property Apgar As WS.DE.DE051000100 [ SqlFieldName = Apgar ];

/// 精神状态正常标志                                                         
Property mental As WS.DE.DE051014200 [ SqlFieldName = mental ];

/// 睡眠状况                                                      
Property sleep As WS.DE.DE051006500 [ SqlFieldName = sleep ];

/// 特殊情况                                                      
Property special As WS.DE.DE051015800 [ SqlFieldName = special ];

/// 心理状态代码                                                      
Property psychology As WS.DE.DE051008400 [ SqlFieldName = psychology ];

/// 营养状态代码                                                      
Property Nutritional As WS.DE.DE051009700 [ SqlFieldName = Nutritional ];

/// 自理能力代码                                                      
Property selfcare As WS.DE.DE051012200 [ SqlFieldName = selfcare ];

/// 饮食情况代码
Property diet As WS.DE.DE030008000 [ SqlFieldName = diet ];

/// 查房记录。用于《上级医师查房记录》
Property wardRoundRec As WS.DE.DE060018100 [ SqlFieldName = ward_round_rec ];

/// 讨论意见。用于《疑难病例讨论记录》
Property suggestion As WS.DE.DE060001800 [ SqlFieldName = suggestion ];

/// 主持人总结意见。用于《疑难病例讨论记录》
Property summary As WS.DE.DE060001800 [ SqlFieldName = summary ];

/// 病历摘要。用于《会诊记录》
Property MRsummary As WS.DE.DE060018200 [ SqlFieldName = MR_summary ];

Storage Default
{
<Data name="HealthAssessmentDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>growth</Value>
</Value>
<Value name="3">
<Value>Apgar</Value>
</Value>
<Value name="4">
<Value>mental</Value>
</Value>
<Value name="5">
<Value>sleep</Value>
</Value>
<Value name="6">
<Value>special</Value>
</Value>
<Value name="7">
<Value>psychology</Value>
</Value>
<Value name="8">
<Value>Nutritional</Value>
</Value>
<Value name="9">
<Value>selfcare</Value>
</Value>
<Value name="10">
<Value>diet</Value>
</Value>
<Value name="11">
<Value>wardRoundRec</Value>
</Value>
<Value name="12">
<Value>suggestion</Value>
</Value>
<Value name="13">
<Value>summary</Value>
</Value>
<Value name="14">
<Value>MRsummary</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.HealthAsses2979D</DataLocation>
<DefaultData>HealthAssessmentDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.HealthAsses2979D</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.HealthAsses2979I</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.HealthAsses2979S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
