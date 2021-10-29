/// Author: QP
/// Version: 1.0
/// Date:2021/07
/// 既往史章节表
/// 注意，既往史不包含过敏史。涵盖C0001、C0002、C0003、C0008、C0009、C0010、C0014、C0015、C0023、C0034
/// 而C0046的既往史章节其实是过敏史章节
Class HCC.SQL.Document.PastHistory Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode = "11348-0";

Parameter SectionName = "HISTORY OF PAST ILLNESS";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)，与HCC_SQL.Document的DocumentNo是主外键关系
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 一般健康状况标志。对应"疾病史条目"
Property healthStatus As WS.DE.DE051003100 [ SqlFieldName = health_stat ];

/// 患者传染性标志。对应"传染病史条目"
Property infectionStatus As WS.DE.DE051011900 [ SqlFieldName = infection_stat ];

/// 手术史标志。对应"手术史条目"
Property surgeryStatus As WS.DE.DE021006200 [ SqlFieldName = surgery_stat ];

/// 有创诊疗操作标志
Property invasiveTreatment As WS.DE.DE051016500 [ SqlFieldName = invasive_treat ];

/// 孕次
Property pregnantTimes As WS.DE.DE040110800 [ SqlFieldName = pregnant_times ];

/// 产次
Property laborTimes As WS.DE.DE021000200 [ SqlFieldName = labor_times ];

/// 疾病史条目子表
Relationship Illnesses As HCC.SQL.Document.PastHistory.Illness [ Cardinality = children, Inverse = PastHistory ];

/// 传染病史条目子表
Relationship Infections As HCC.SQL.Document.PastHistory.Infection [ Cardinality = children, Inverse = PastHistory ];

/// 手术史条目子表
Relationship Surgeries As HCC.SQL.Document.PastHistory.Surgery [ Cardinality = children, Inverse = PastHistory ];

/// 孕产史条目子表
Relationship Obstetrics As HCC.SQL.Document.PastHistory.Obstetric [ Cardinality = children, Inverse = PastHistory ];

/// 既往史条目子表
Relationship Healths As HCC.SQL.Document.PastHistory.Health [ Cardinality = children, Inverse = PastHistory ];

/// 输血史条目子表
Relationship Transfusions As HCC.SQL.Document.PastHistory.Transfusion [ Cardinality = children, Inverse = PastHistory ];

Storage Default
{
<Data name="PastHistoryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>healthStatus</Value>
</Value>
<Value name="3">
<Value>infectionStatus</Value>
</Value>
<Value name="4">
<Value>surgeryStatus</Value>
</Value>
<Value name="5">
<Value>invasiveTreatment</Value>
</Value>
<Value name="6">
<Value>pregnantTimes</Value>
</Value>
<Value name="7">
<Value>laborTimes</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.PastHistoryD</DataLocation>
<DefaultData>PastHistoryDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.PastHistoryD</IdLocation>
<IndexLocation>^HCC.SQL.Document.PastHistoryI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.PastHistoryS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
