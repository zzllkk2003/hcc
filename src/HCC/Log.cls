/// Author: QP
/// Version: 1.0
/// Date:2021/08
/// HCC日志
Class HCC.Log Extends (%Persistent, %XML.Adaptor)
{

/// 日志类型
Property Type As %String;

/// 操作
Property Action As %String;

/// 文档号
Property DocNum As %String;

/// 日志内容
Property Msg As %String(MAXLEN = 500);

/// 日志记录时间
Property LogTime As %TimeStamp [ InitialExpression = {$ZDATETIME($ZDATETIMEH($ZTS,-3),3,1,4)} ];

/// Ensemble session id
Property Session As %String;

Storage Default
{
<Data name="LogDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Type</Value>
</Value>
<Value name="3">
<Value>Action</Value>
</Value>
<Value name="4">
<Value>DocNum</Value>
</Value>
<Value name="5">
<Value>Msg</Value>
</Value>
<Value name="6">
<Value>LogTime</Value>
</Value>
<Value name="7">
<Value>Session</Value>
</Value>
</Data>
<DataLocation>^HCC.LogD</DataLocation>
<DefaultData>LogDefaultData</DefaultData>
<IdLocation>^HCC.LogD</IdLocation>
<IndexLocation>^HCC.LogI</IndexLocation>
<StreamLocation>^HCC.LogS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
