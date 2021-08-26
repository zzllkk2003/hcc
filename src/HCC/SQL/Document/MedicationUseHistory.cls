/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 用药章节表
Class HCC.SQL.Document.MedicationUseHistory Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "10160-0";

Parameter SectionName = "HISTORY OF MEDICATION USE";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 处方有效天数，用于《中药处方》
Property validDays As WS.DE.DE060029400 [ SqlFieldName = valid_days ];

/// 处方药品组号，用于《中药处方》
Property groupNo As WS.DE.DE085005600 [ SqlFieldName = group_no ];

/// 医嘱备注信息
Property notes As WS.DE.DE060017900 [ SqlFieldName = notes ];

/// 医嘱内容，用于《疑难病例讨论记录》、《转科记录》、《阶段小结》
Property content As WS.DE.DE060028700 [ SqlFieldName = content ];

/// 处方类别代码，用于《中药处方》
Property presType As WS.DE.DE085003200 [ SqlFieldName = pres_type ];

/// 中药煎煮法，用于《日常病程记录》、《上级医师查房记录》、《疑难病例讨论记录》、《转科记录》、《阶段小结》
Property TCMCook As WS.DE.DE085004700 [ SqlFieldName = TCM_cook ];

/// 中药用药方法，用于《日常病程记录》、《上级医师查房记录》、《疑难病例讨论记录》、《转科记录》、《阶段小结》
Property TCMUseWay As WS.DE.DE060013600 [ SqlFieldName = TCM_use_way ];

/// 处方条目/用药条目子表，用于《西药处方》、《中药处方》、《出入量记录》
Relationship MedicineItems As HCC.SQL.Document.MedicationUseHistory.MedicineItem [ Cardinality = children, Inverse = MedicationUseHistory ];

/// 中药饮片条目子表，用于《中药处方》
Relationship HerbalPieces As HCC.SQL.Document.MedicationUseHistory.HerbalPiece [ Cardinality = children, Inverse = MedicationUseHistory ];

/// 术前用药条目子表，用于《一般手术记录》
Relationship PreSurMeds As HCC.SQL.Document.MedicationUseHistory.PreSurMed [ Cardinality = children, Inverse = MedicationUseHistory ];

/// 术中用药条目子表，用于《一般手术记录》
Relationship InSurMeds As HCC.SQL.Document.MedicationUseHistory.InSurMed [ Cardinality = children, Inverse = MedicationUseHistory ];

Storage Default
{
<Data name="MedicationUseHistoryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>validDays</Value>
</Value>
<Value name="3">
<Value>groupNo</Value>
</Value>
<Value name="4">
<Value>notes</Value>
</Value>
<Value name="5">
<Value>content</Value>
</Value>
<Value name="6">
<Value>presType</Value>
</Value>
<Value name="7">
<Value>TCMCook</Value>
</Value>
<Value name="8">
<Value>TCMUseWay</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.MedicationUC801D</DataLocation>
<DefaultData>MedicationUseHistoryDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.MedicationUC801D</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.MedicationUC801I</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.MedicationUC801S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
