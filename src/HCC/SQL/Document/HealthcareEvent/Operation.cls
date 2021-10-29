/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 卫生事件章节-手术及操作子表
Class HCC.SQL.Document.HealthcareEvent.Operation Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

/// 手术(操作)代码
Property name As WS.DE.DE060009300 [ SqlFieldName = name ];

/// 文档编号
Relationship healthcareEvent As HCC.SQL.Document.HealthcareEvent [ Cardinality = parent, Inverse = operations, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="OperationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("operations")</DataLocation>
<DefaultData>OperationDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.HealthcareE7CC8C("operations")</IdLocation>
<IndexLocation>^HCC.SQL.Document2E2.OperationI</IndexLocation>
<StreamLocation>^HCC.SQL.Document2E2.OperationS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
