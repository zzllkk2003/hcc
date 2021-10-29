/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 器械物品核对章节表
Class HCC.SQL.Document.InstrumentVerification Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode;

Parameter SectionName = "术前器械物品核对";

Parameter SectionCodeSystemOID;

Parameter SectionCodeSystem;

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 术前                                                  
Property preoperation As HCC.SQL.Document.InstrumentVerification.Verification [ SqlFieldName = preop ];

/// 关前                                                  
Property beforeClose As HCC.SQL.Document.InstrumentVerification.VerificationClose [ SqlFieldName = bef_clse ];

/// 关后                                                  
Property afterClose As HCC.SQL.Document.InstrumentVerification.VerificationClose [ SqlFieldName = aft_clse ];

Storage Default
{
<Data name="InstrumentVerificationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>preoperation</Value>
</Value>
<Value name="3">
<Value>beforeClose</Value>
</Value>
<Value name="4">
<Value>afterClose</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.InstrumentV59CFD</DataLocation>
<DefaultData>InstrumentVerificationDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.InstrumentV59CFD</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.InstrumentV59CFI</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.InstrumentV59CFS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
