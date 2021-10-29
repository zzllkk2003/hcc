/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 入院信息章节表
Class HCC.SQL.Document.AdmissionInformation Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode;

Parameter SectionName = "入院信息";

Parameter SectionCodeSystemOID;

Parameter SectionCodeSystem;

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 入院原因描述
Property admitReason As WS.DE.DE051005300 [ SqlFieldName = admit_rsn ];

/// 入院途径代码
Property route As WS.DE.DE060033900 [ SqlFieldName = route ];

/// 入病房方式描述
Property admitMode As WS.DE.DE060023700 [ SqlFieldName = admit_mode ];

Storage Default
{
<Data name="AdmissionInformationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>admitReason</Value>
</Value>
<Value name="3">
<Value>route</Value>
</Value>
<Value name="4">
<Value>admitMode</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.AdmissionIn24B1D</DataLocation>
<DefaultData>AdmissionInformationDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.AdmissionIn24B1D</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.AdmissionIn24B1I</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.AdmissionIn24B1S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
