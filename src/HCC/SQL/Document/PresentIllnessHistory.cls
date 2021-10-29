/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 现病史章节表
/// 涵盖《门急诊病历》
Class HCC.SQL.Document.PresentIllnessHistory Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode = "10164-2";

Parameter SectionName = "HISTORY OF PRESENT ILLNESS";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 现病史
Property presentIllness As WS.DE.DE021007100 [ SqlFieldName = present_ill ];

/// 简要病史。用于《麻醉术前访视记录》
Property briefIllness As WS.DE.DE051014000 [ SqlFieldName = brief_ill ];

Storage Default
{
<Data name="PresentIllnessHistoryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>presentIllness</Value>
</Value>
<Value name="3">
<Value>briefIllness</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.PresentIlln9B98D</DataLocation>
<DefaultData>PresentIllnessHistoryDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.PresentIlln9B98D</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.PresentIlln9B98I</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.PresentIlln9B98S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
