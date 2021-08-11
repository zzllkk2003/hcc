/// Author: QP
/// Version: 1.0
/// Date:2021/07
/// 实验室检查章节表
/// 注意：
/// 1. WST500.10-2016《麻醉术前访视记录》需要以下字段：
/// anes_visit_ABG_Value,
/// anes_visit_CBC_Value,
/// anes_visit_CT_Value,
/// anes_visit_EKG_Value,
/// anes_visit_MRI_Value,
/// anes_visit_XRay_Value,
/// anes_visit_coagulation_Value,
/// anes_visit_liver_Value,
/// anes_visit_lungFunc_Value,
/// anes_visit_ultrasonic_Value,
/// anes_visit_urine_Value
/// 2. WST500.02-2016《门（急）诊病历》和 WST500.03-2016《急诊留观病历》需要提交辅助检查条目子表：HCC_SQL_Document_LabTest.AuxExam
/// 3. WST500.053-2016《出院小结》需要提交阳性辅助检查结果条目子表：HCC_SQL_Document_LabTest.AuxExamResult
/// 4. WST500.07-2016《检验记录》和WST500.44-2016《抢救记录》需要提交检验条目子表：HCC_SQL_Document_LabTest.Item
Class HCC.SQL.Document.LabTest Extends (%Persistent, %XML.Adaptor)
{

Parameter XMLIGNORENULL = 1;

Parameter SectionCode = "30954-2";

Parameter SectionName = "STUDIES SUMMARY";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 检验方法名称
Property testMethod As WS.DE.DE021002700 [ SqlFieldName = test_method ];

/// 检验类别
Property testCategory As WS.DE.DE043001800 [ SqlFieldName = test_cat ];

/// ABO血型
Property bloodABO As WS.DE.DE045000100 [ SqlFieldName = blood_ABO ];

/// Rh血型
Property bloodRh As WS.DE.DE045001000 [ SqlFieldName = blood_Rh ];

/// 麻醉术前访视检查
Property anesthesiaVisit As HCC.SQL.Document.LabTest.AnesthesiaVisit [ SqlFieldName = anes_visit ];

/// 检验条目子表。用于《检验报告》、《抢救记录》
Relationship Items As HCC.SQL.Document.LabTest.Item [ Cardinality = children, Inverse = LabTest ];

/// 辅助检查条目子表。用于《门(急)诊病历》
Relationship AuxExams As HCC.SQL.Document.LabTest.AuxExam [ Cardinality = children, Inverse = LabTest ];

/// 阳性辅助检查结果条目子表。用于《出院小结》
Relationship AuxExamResults As HCC.SQL.Document.LabTest.AuxExamResult [ Cardinality = children, Inverse = LabTest ];

Storage Default
{
<Data name="LabTestDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>testMethod</Value>
</Value>
<Value name="3">
<Value>testCategory</Value>
</Value>
<Value name="4">
<Value>bloodABO</Value>
</Value>
<Value name="5">
<Value>bloodRh</Value>
</Value>
<Value name="6">
<Value>anesthesiaVisit</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.LabTestD</DataLocation>
<DefaultData>LabTestDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.LabTestD</IdLocation>
<IndexLocation>^HCC.SQL.Document.LabTestI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.LabTestS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
