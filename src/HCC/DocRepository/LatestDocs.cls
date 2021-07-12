/// 共享文档存储表
/// 需要增加Unique Key在DocId上。暂时不加，等Jeff修改文档注册服务
Class HCC.DocRepository.LatestDocs Extends (%Persistent, %XML.Adaptor) [ SqlTableName = GXWD_DOC ]
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
Property Content As %String(MAXLEN = 4000000);

/// 患者唯一标识
Property PatId As %String;

/// 住院号标识
Property PatInHosCode As %String;

/// 住院次数
Property PatInHosCount As %Integer [ InitialExpression = 1 ];

/// 门诊号标识
Property PatOutHosCode As %String;

/// 患者就诊日期起始时间
Property PatEffectiveLowTime As %TimeStamp;

/// 患者就诊日期截至时间
Property PatEffectiveHighTime As %TimeStamp;

/// 身份证号
Property PatCardId As %String;

/// 患者姓名
Property PatName As %String;

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

Storage Default
{
<Data name="GXWDDOCDefaultData">
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
<Value>PatEffectiveTime</Value>
</Value>
<Value name="15">
<Value>PatCardId</Value>
</Value>
<Value name="16">
<Value>PatName</Value>
</Value>
<Value name="17">
<Value>ProHosCode</Value>
</Value>
<Value name="18">
<Value>ProHosName</Value>
</Value>
<Value name="19">
<Value>DeptCode</Value>
</Value>
<Value name="20">
<Value>DocUserCode</Value>
</Value>
<Value name="21">
<Value>DocUserName</Value>
</Value>
<Value name="22">
<Value>RepHosCode</Value>
</Value>
<Value name="23">
<Value>RepHosName</Value>
</Value>
<Value name="24">
<Value>AddDate</Value>
</Value>
<Value name="25">
<Value>PatEffectiveLowTime</Value>
</Value>
<Value name="26">
<Value>PatEffectiveHighTime</Value>
</Value>
<Value name="27">
<Value>SuppressXmlns</Value>
</Value>
</Data>
<DataLocation>^HCC.DocRepository.LatestDocsD</DataLocation>
<DefaultData>GXWDDOCDefaultData</DefaultData>
<IdLocation>^HCC.DocRepository.LatestDocsD</IdLocation>
<IndexLocation>^HCC.DocRepository.LatestDocsI</IndexLocation>
<StreamLocation>^HCC.DocRepository.LatestDocsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
