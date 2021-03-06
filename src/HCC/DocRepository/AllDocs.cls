/// 
/// Author: Jeff Liu
/// Date: 2021-07-13 14:29:38
/// LastEditTime: 2021-11-01 15:07:40
/// LastEditors: Jeff Liu
/// Description: 
/// FilePath: /hcc/Users/jiliu/Library/Caches/com.lemonmojo.RoyalTSX.App/LMFileTransferConnection/58960896-ff1c-4a69-b396-eb0b474ef9a2/L2hvbWUvaGNjL3NyYy9IQ0MvRG9jUmVwb3NpdG9yeQ==/AllDocs.cls
/// Jeff.liu@intersytems.com
/// 
/// 共享文档存储表
Class HCC.DocRepository.AllDocs Extends (%Persistent, %XML.Adaptor) [ DependsOn = HCC.DocRepository.Patient, SqlTableName = AllDocs ]
{

Parameter XMLNamespace = "urn:hl7-org:v3";

/// 消息创建时间
Property MsgCreatTime As %TimeStamp;

/// 发送系统标识
Property SenderId As %String;

/// 文档编号
Property DocId As %String;

/// 文档类型代码
Property DocCode As %String;

/// 文档类型名称
Property DocName As %String;

/// 文档生成日期时间
Property DocCreatTime As %TimeStamp;

/// 文档版本号
Property VersionNumber As %Integer [ InitialExpression = 1 ];

/// 文档原始内容
Property Content As %String(MAXLEN = "");

// Property PatId As %String;

/// 患者唯一标识
/// 住院号标识
Property PatInHosCode As %String;

// Property PatInHosCount As %Integer [ InitialExpression = 1 ];

/// 住院次数
/// 门诊号标识
Property PatOutHosCode As %String;

/// 患者就诊日期起始时间
Property PatEffectiveLowTime As %TimeStamp;

/// 患者就诊日期截至时间
Property PatEffectiveHighTime As %TimeStamp;

// Property PatCardId As %String;

// Property PatName As %String;

/// 身份证号
/// 患者姓名
/// 文档提供的医院标识
Property ProHosCode As %String;

/// 文档提供的医院名称
Property ProHosName As %String;

/// 科室代码
Property DeptCode As %String;

/// 文档创建者编号
Property DocUserCode As %String;

/// 文档创建者姓名
Property DocUserName As %String;

/// 文档保管的医院标识
Property RepHosCode As %String;

/// 文档保管的医院名称
Property RepHosName As %String;

/// 数据存储时间
Property AddDate As %TimeStamp;

/// 病人 one
Relationship Patient As HCC.DocRepository.Patient [ Cardinality = one, Inverse = DocA ];

Storage Default
{
<Data name="GXWDDOCTDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>MsgCreatTime</Value>
</Value>
<Value name="3">
<Value>SenderId</Value>
</Value>
<Value name="4">
<Value>DocId</Value>
</Value>
<Value name="5">
<Value>DocCode</Value>
</Value>
<Value name="6">
<Value>DocName</Value>
</Value>
<Value name="7">
<Value>DocCreatTime</Value>
</Value>
<Value name="8">
<Value>VersionNumber</Value>
</Value>
<Value name="9">
<Value>Content</Value>
</Value>
<Value name="10">
<Value>PatId</Value>
</Value>
<Value name="11">
<Value>PatInHosCode</Value>
</Value>
<Value name="12">
<Value>PatInHosCount</Value>
</Value>
<Value name="13">
<Value>PatOutHosCode</Value>
</Value>
<Value name="14">
<Value>PatEffectiveLowTime</Value>
</Value>
<Value name="15">
<Value>PatEffectiveHighTime</Value>
</Value>
<Value name="16">
<Value>PatCardId</Value>
</Value>
<Value name="17">
<Value>PatName</Value>
</Value>
<Value name="18">
<Value>ProHosCode</Value>
</Value>
<Value name="19">
<Value>ProHosName</Value>
</Value>
<Value name="20">
<Value>DeptCode</Value>
</Value>
<Value name="21">
<Value>DocUserCode</Value>
</Value>
<Value name="22">
<Value>DocUserName</Value>
</Value>
<Value name="23">
<Value>RepHosCode</Value>
</Value>
<Value name="24">
<Value>RepHosName</Value>
</Value>
<Value name="25">
<Value>AddDate</Value>
</Value>
<Value name="26">
<Value>ExportDate</Value>
</Value>
<Value name="27">
<Value>Patient</Value>
</Value>
</Data>
<DataLocation>^HCC.DocRepository.AllDocsD</DataLocation>
<DefaultData>GXWDDOCTDefaultData</DefaultData>
<IdLocation>^HCC.DocRepository.AllDocsD</IdLocation>
<IndexLocation>^HCC.DocRepository.AllDocsI</IndexLocation>
<StreamLocation>^HCC.DocRepository.AllDocsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
