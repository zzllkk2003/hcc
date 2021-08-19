/// Author: QP
/// Version: 1.0
/// Date:2021/08
/// HCC服务调用历史记录
Class HCC.SVR.ServiceLog Extends (%Persistent, %XML.Adaptor)
{

/// 服务类型。对应46个互联互通服务
Property ServiceType As %String;

/// 服务会话ID
Property Session As %String;

/// 会话开始时间
Property BeginTS As %TimeStamp;

/// 会话结束时间
/// 由后台任务同步
Property EndTS As %TimeStamp;

/// 会话结果
/// 由后台任务同步
Property Result As Ens.DataType.MessageStatus;

// Property EndTSLocal As %String [ SqlComputeCode = { Set {*} =  {EndTS} }, SqlComputed, SqlComputeOnChange = EndTS ];

// Property BeginTSLocal As %String [ SqlComputeCode = { Set {*} = $ZDATETIME($ZDATETIMEH({BeginTS},-3),3) }, SqlComputed, SqlComputeOnChange = BeginTS ];

Index IndSvrType On ServiceType [ Type = bitmap ];

Storage Default
{
<Data name="ServiceLogDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ServiceType</Value>
</Value>
<Value name="3">
<Value>Session</Value>
</Value>
<Value name="4">
<Value>Begin</Value>
</Value>
<Value name="5">
<Value>End</Value>
</Value>
<Value name="6">
<Value>Result</Value>
</Value>
<Value name="7">
<Value>BeginTS</Value>
</Value>
<Value name="8">
<Value>EndTS</Value>
</Value>
<Value name="9">
<Value>BeginTSLocal</Value>
</Value>
<Value name="10">
<Value>EndTSLocal</Value>
</Value>
</Data>
<DataLocation>^HCC.SVR.ServiceLogD</DataLocation>
<DefaultData>ServiceLogDefaultData</DefaultData>
<IdLocation>^HCC.SVR.ServiceLogD</IdLocation>
<IndexLocation>^HCC.SVR.ServiceLogI</IndexLocation>
<StreamLocation>^HCC.SVR.ServiceLogS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
