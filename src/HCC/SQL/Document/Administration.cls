/// Author: QP
/// Version: 1.0
/// Date:2021/07/08
/// 行政管理章节表
Class HCC.SQL.Document.Administration Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode;

Parameter SectionName = "行政管理";

Parameter SectionCodeSystemOID;

Parameter SectionCodeSystem;

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 死亡患者尸检标志
Property autospy As WS.DE.DE090010800 [ SqlFieldName = autospy ];

/// 病案质量
Property MRQuality As WS.DE.DE090010300 [ SqlFieldName = MR_quality ];

/// 质控日期
Property QCDate As WS.DE.DE090012000 [ SqlFieldName = QC_date ];

/// 病案质量等级
Property MRQualityLevel As %String [ SqlFieldName = MR_quality_level ];

/// 质控医生姓名
Property QCDoctor As WS.DE.DE020103900 [ SqlFieldName = QC_doctor ];

/// 质控护士姓名
Property QCNurse As WS.DE.DE020103900 [ SqlFieldName = QC_nurse ];

Storage Default
{
<Data name="AdministrationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>staydays</Value>
</Value>
<Value name="3">
<Value>dischargeWard</Value>
</Value>
<Value name="4">
<Value>MRQualityLevel</Value>
</Value>
<Value name="5">
<Value>QCDoctor</Value>
</Value>
<Value name="6">
<Value>QCNurse</Value>
</Value>
<Value name="7">
<Value>QCDate</Value>
</Value>
<Value name="8">
<Value>MRQuality</Value>
</Value>
<Value name="9">
<Value>autospy</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Doc70F6.AdministrationD</DataLocation>
<DefaultData>AdministrationDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Doc70F6.AdministrationD</IdLocation>
<IndexLocation>^HCC.SQL.Doc70F6.AdministrationI</IndexLocation>
<StreamLocation>^HCC.SQL.Doc70F6.AdministrationS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
