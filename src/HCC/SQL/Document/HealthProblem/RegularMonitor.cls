/// 主要健康问题章节 - 常规监测项目
Class HCC.SQL.Document.HealthProblem.RegularMonitor Extends (%Persistent, %XML.Adaptor)
{

/// 常规监测项目名称。用于《麻醉记录》
Property regularMonitor As WS.DE.DE060021600 [ SqlFieldName = item ];

/// 常规监测项目结果。用于《麻醉记录》
Property regularMonitorResult As WS.DE.DE060028100 [ SqlFieldName = result ];

/// 文档编号
Relationship healthProblem As HCC.SQL.Document.HealthProblem [ Cardinality = parent, Inverse = regMonitors, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="RegularMonitorDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>regularMonitor</Value>
</Value>
<Value name="3">
<Value>regularMonitorResult</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("regMonitors")</DataLocation>
<DefaultData>RegularMonitorDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Docu70F6.HealthProblemC("regMonitors")</IdLocation>
<IndexLocation>^HCC.SQL.DocDAD8.RegularMonitorI</IndexLocation>
<StreamLocation>^HCC.SQL.DocDAD8.RegularMonitorS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
