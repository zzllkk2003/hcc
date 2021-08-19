/// 主要健康问题章节 - 中医“四诊”观察结果
Class HCC.SQL.Document.HealthProblem.TCMObservation Extends (%Persistent, %XML.Adaptor)
{

/// 中医“四诊”观察结果
Property item As WS.DE.DE021002800 [ SqlFieldName = item ];

/// 文档编号
Relationship healthProblem As HCC.SQL.Document.HealthProblem [ Cardinality = parent, Inverse = TCMObs, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="TCMObservationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>item</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("TCMObs")</DataLocation>
<DefaultData>TCMObservationDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Docu70F6.HealthProblemC("TCMObs")</IdLocation>
<IndexLocation>^HCC.SQL.DocDAD8.TCMObservationI</IndexLocation>
<StreamLocation>^HCC.SQL.DocDAD8.TCMObservationS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
