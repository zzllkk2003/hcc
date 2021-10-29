/// 主要健康问题章节 - 特殊情况。用于《麻醉术后访视记录》
Class HCC.SQL.Document.HealthProblem.Exception Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

/// 特殊情况
Property item As WS.DE.DE051015800 [ SqlFieldName = item ];

/// 文档编号
Relationship healthProblem As HCC.SQL.Document.HealthProblem [ Cardinality = parent, Inverse = exceptions, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="ExceptionDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>item</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("exceptions")</DataLocation>
<DefaultData>ExceptionDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Docu70F6.HealthProblemC("exceptions")</IdLocation>
<IndexLocation>^HCC.SQL.DocumentDAD8.ExceptionI</IndexLocation>
<StreamLocation>^HCC.SQL.DocumentDAD8.ExceptionS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
