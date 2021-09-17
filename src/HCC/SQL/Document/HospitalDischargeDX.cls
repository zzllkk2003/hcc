/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 出院诊断章节表
Class HCC.SQL.Document.HospitalDischargeDX Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode = "11535-2";

Parameter SectionName = "HOSPITAL DISCHARGE DX";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 出院日期时间。用于《出院评估与指导》需要
Property dischargeTime As WS.DE.DE060001700 [ SqlFieldName = dchg_time ];

/// 出院情况描述。用于《出院评估与指导》需要
Property dischargeCondition As WS.DE.DE060019300 [ SqlFieldName = dchg_cond ];

/// 离院方式
Property dischargeDisposition As WS.DE.DE060022300 [ Required, SqlFieldName = dchg_disp ];

/// 拟接受医疗机构名称
Property receivingOrganization As WS.DE.DE081001300 [ SqlFieldName = recv_org ];

/// 出院中医诊断-主病子表
Relationship TCM As HCC.SQL.Document.HospitalDischargeDX.TCM [ Cardinality = children, Inverse = HospitalDischargeDX ];

/// 出院中医诊断-主证子表
Relationship TCMSyndrome As HCC.SQL.Document.HospitalDischargeDX.TCMSyndrome [ Cardinality = children, Inverse = HospitalDischargeDX ];

/// 主要诊断子表
Relationship Primarys As HCC.SQL.Document.HospitalDischargeDX.Primary [ Cardinality = children, Inverse = HospitalDischargeDX ];

/// 其它诊断子表
Relationship Others As HCC.SQL.Document.HospitalDischargeDX.Other [ Cardinality = children, Inverse = HospitalDischargeDX ];

/// 出院时症状与体征。用于《出院小结》
Property dischargeSymptom As WS.DE.DE040111700 [ SqlFieldName = dchg_symptom ];

/// 出院医嘱。用于《出院小结》
Property dischargeOrder As WS.DE.DE060028700 [ SqlFieldName = dchg_order ];

/// 中医“四诊”观察结果。用于《出院小结》
Property TCMObservation As WS.DE.DE021002800 [ SqlFieldName = TCM_obs ];

Storage Default
{
<Data name="HospitalDischargeDXDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>DischargeDisposition</Value>
</Value>
<Value name="3">
<Value>receivingOrganization</Value>
</Value>
<Value name="4">
<Value>dischargeTime</Value>
</Value>
<Value name="5">
<Value>dischargeCondition</Value>
</Value>
<Value name="6">
<Value>dischargeDisposition</Value>
</Value>
<Value name="7">
<Value>dischargeSymptom</Value>
</Value>
<Value name="8">
<Value>dischargeOrder</Value>
</Value>
<Value name="9">
<Value>TCMObservation</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.HospitalDisC1A4D</DataLocation>
<DefaultData>HospitalDischargeDXDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.HospitalDisC1A4D</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.HospitalDisC1A4I</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.HospitalDisC1A4S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
