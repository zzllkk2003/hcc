/// Author: QP
/// Version: 1.0
/// Date:2021/09
/// 数据治理日志
Class HIP.DataGov.Log Extends %Persistent
{

Parameter DSTIME As STRING [ Constraint = ",AUTO,MANUAL", Flags = ENUM ] = "AUTO";

Parameter DSINTERVAL = 1;

Property SQLTable As %String;

Property RecordId As %String;

Property ColumnName As %String;

Property Value As %String(MAXLEN = "");

Property Error As %String(MAXLEN = "");

Property ErrorCode As %String;

Property Batch As %String;

Property Time As %TimeStamp [ InitialExpression = {$ZDATETIME($ZDATETIMEH($ZTS,-3),3,1,4)} ];

Storage Default
{
<Data name="LogDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>SQLTable</Value>
</Value>
<Value name="3">
<Value>RecordId</Value>
</Value>
<Value name="4">
<Value>ColumnName</Value>
</Value>
<Value name="5">
<Value>Value</Value>
</Value>
<Value name="6">
<Value>Error</Value>
</Value>
<Value name="7">
<Value>ErrorCode</Value>
</Value>
<Value name="8">
<Value>Time</Value>
</Value>
<Value name="9">
<Value>Batch</Value>
</Value>
</Data>
<DataLocation>^HIP.DataGov.LogD</DataLocation>
<DefaultData>LogDefaultData</DefaultData>
<IdLocation>^HIP.DataGov.LogD</IdLocation>
<IndexLocation>^HIP.DataGov.LogI</IndexLocation>
<StreamLocation>^HIP.DataGov.LogS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
