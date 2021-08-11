/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 转科记录章节表
/// 涵盖《住院病案首页》和《住院病程记录/转科记录》
Class HCC.SQL.Document.Referral Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "42349-1";

Parameter SectionName = "REASON FOR REFERRAL";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 转科类型代码
Property referralType As WS.DE.DE060031400 [ SqlFieldName = referral_type ];

/// 转科目的代码
Property referralReason As WS.DE.DE060031500 [ SqlFieldName = referral_rsn ];

/// 住院患者转科科室名称
Property referralTarget As WS.DE.DE081002600 [ SqlFieldName = referral_target ];

/// 住院患者转出科室名称
Property referralSource As WS.DE.DE081002600 [ SqlFieldName = referral_source ];

Storage Default
{
<Data name="ReferralDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>referralReason</Value>
</Value>
<Value name="3">
<Value>referralTarget</Value>
</Value>
<Value name="4">
<Value>referralType</Value>
</Value>
<Value name="5">
<Value>referralSource</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.ReferralD</DataLocation>
<DefaultData>ReferralDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.ReferralD</IdLocation>
<IndexLocation>^HCC.SQL.Document.ReferralI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.ReferralS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
