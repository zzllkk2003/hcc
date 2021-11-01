/// 
/// Author: Jeff Liu
/// Date: 2021-07-14 14:20:35
/// LastEditTime: 2021-11-01 15:15:20
/// LastEditors: Jeff Liu
/// Description: 
/// FilePath: /hcc/Users/jiliu/Library/Caches/com.lemonmojo.RoyalTSX.App/LMFileTransferConnection/58960896-ff1c-4a69-b396-eb0b474ef9a2/L2hvbWUvaGNjL3NyYy9IQ0MvRG9jUmVwb3NpdG9yeQ==/Patient.cls
/// Jeff.liu@intersytems.com
/// 
/// 文档模型的患者类
Class HCC.DocRepository.Patient Extends (%Persistent, %XML.Adaptor)
{

/// 患者唯一标识
Property PatId As %String;

/// unique
Index UKPatIdI On PatId [ Unique ];

// Property PatInHosCode As %String;

// Property PatOutHosCode As %String;

/// 住院号标识
/// 门诊号标识
/// 身份证号
Property PatCardId As %String;

/// unique
Index UKPatCardIdI On PatCardId [ Unique ];

/// 患者姓名
Property PatName As %String;

Relationship DocL As HCC.DocRepository.LatestDocs(XMLPROJECTION = "NONE") [ Cardinality = many, Inverse = Patient ];

Relationship DocA As HCC.DocRepository.AllDocs(XMLPROJECTION = "NONE") [ Cardinality = many, Inverse = Patient ];

Storage Default
{
<Data name="PatientDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PatId</Value>
</Value>
<Value name="3">
<Value>PatInHosCode</Value>
</Value>
<Value name="4">
<Value>PatInHosCount</Value>
</Value>
<Value name="5">
<Value>PatOutHosCode</Value>
</Value>
<Value name="6">
<Value>PatEffectiveLowTime</Value>
</Value>
<Value name="7">
<Value>PatEffectiveHighTime</Value>
</Value>
<Value name="8">
<Value>PatCardId</Value>
</Value>
<Value name="9">
<Value>PatName</Value>
</Value>
</Data>
<DataLocation>^HCC.DocRepository.PatientD</DataLocation>
<DefaultData>PatientDefaultData</DefaultData>
<IdLocation>^HCC.DocRepository.PatientD</IdLocation>
<IndexLocation>^HCC.DocRepository.PatientI</IndexLocation>
<StreamLocation>^HCC.DocRepository.PatientS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
