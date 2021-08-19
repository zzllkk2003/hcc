/// 主要健康问题章节 - 特殊监测项目
Class HCC.SQL.Document.HealthProblem.SpecialMonitor Extends (%Persistent, %XML.Adaptor)
{

/// 特殊监测项目名称。用于《麻醉记录》
Property Item As WS.DE.DE060021600 [ SqlFieldName = item ];

/// 特殊监测项目结果。用于《麻醉记录》
Property Result As WS.DE.DE060028100 [ SqlFieldName = result ];

/// 文档编号
Relationship healthProblem As HCC.SQL.Document.HealthProblem [ Cardinality = parent, Inverse = speMonitors, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="SpecialMonitorDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Item</Value>
</Value>
<Value name="3">
<Value>Result</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("speMonitors")</DataLocation>
<DefaultData>SpecialMonitorDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Docu70F6.HealthProblemC("speMonitors")</IdLocation>
<IndexLocation>^HCC.SQL.DocDAD8.SpecialMonitorI</IndexLocation>
<StreamLocation>^HCC.SQL.DocDAD8.SpecialMonitorS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
