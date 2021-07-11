/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 出院诊断章节
Class HCC.SQL.Document.HospitalDischargeDX Extends (%Persistent, %XML.Adaptor)
{

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(ukDocNo);

/// 离院方式
Property DischargeDisposition As WS.DE.DE060022300 [ Required, SqlFieldName = dischargeDisposition ];

/// 拟接受医疗机构名称
Property receivingOrganization As WS.DE.DE081001300 [ SqlFieldName = receivingOrganization ];

/// 主要诊断
Relationship Primarys As HCC.SQL.Document.HospitalDischargeDX.Primary [ Cardinality = children, Inverse = HospitalDischargeDX ];

/// 其它诊断
Relationship Others As HCC.SQL.Document.HospitalDischargeDX.Other [ Cardinality = children, Inverse = HospitalDischargeDX ];

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
</Data>
<DataLocation>^HCC.SQL.Do70F6.HospitalDisC1A4D</DataLocation>
<DefaultData>HospitalDischargeDXDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.HospitalDisC1A4D</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.HospitalDisC1A4I</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.HospitalDisC1A4S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
