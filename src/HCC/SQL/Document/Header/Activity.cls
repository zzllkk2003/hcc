/// 文档活动类
Class HCC.SQL.Document.Header.Activity Extends (%SerialObject, %XML.Adaptor)
{

/// 文档模板编号OID
Property templateId As %String [ ReadOnly, SqlComputeCode = {set {templateId}=$lg($G(^WS.Doc.Code({code})),2)}, SqlComputed, SqlComputeOnChange = code ];

/// 文档流水号
Property docid As %String [ InitialExpression = {$ZCVT($SYSTEM.Util.CreateGUID(),"L")}, Required ];

/// 文档类型代码
/// title,templateId都由code自动赋值
/// Set ..title=$lg($G(^WS.Doc.Code(..code)),1),..templateId=$lg($G(^WS.Doc.Code(..code)),2) 
Property code As %String [ Required ];

/// 文档标题
Property title As %String [ ReadOnly, SqlComputeCode = {set {title}=$lg($G(^WS.Doc.Code({code})),1)}, SqlComputed, SqlComputeOnChange = code ];

/// 文档机器生成时间
Property effectiveTime As %String [ Required ];

/// 文档密级代码
Property confidentialityCode As %String [ InitialExpression = "N", Required ];

/// 文档语言类型编码
Property languageCode As %String [ InitialExpression = "zh-CN", Required ];

/// 文档集合编号
Property setId As %String;

/// 文档版本号码
Property versionNumber As %String;

Storage Default
{
<Data name="ActivityState">
<Value name="1">
<Value>templateId</Value>
</Value>
<Value name="2">
<Value>docid</Value>
</Value>
<Value name="3">
<Value>code</Value>
</Value>
<Value name="4">
<Value>title</Value>
</Value>
<Value name="5">
<Value>effectiveTime</Value>
</Value>
<Value name="6">
<Value>confidentialityCode</Value>
</Value>
<Value name="7">
<Value>languageCode</Value>
</Value>
<Value name="8">
<Value>setId</Value>
</Value>
<Value name="9">
<Value>versionNumber</Value>
</Value>
</Data>
<State>ActivityState</State>
<StreamLocation>^HCC.SQL.DocumentEBE5.ActivityS</StreamLocation>
<Type>%Storage.Serial</Type>
}

Trigger BeforeInsert [ Event = INSERT ]
{
    Set {title}=$lg($G(^WS.Doc.Code({code})),1),{templateId}=$lg($G(^WS.Doc.Code({code})),2)
}

}
