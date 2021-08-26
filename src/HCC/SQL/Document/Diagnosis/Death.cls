/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 死亡诊断子表
Class HCC.SQL.Document.Diagnosis.Death Extends (%Persistent, %XML.Adaptor)
{

/// 死亡诊断代码
Property code As WS.DE.DE050102100 [ SqlFieldName = code ];

/// 死亡诊断名称。
Property name As WS.DE.DE050102500 [ SqlFieldName = name ];

/// 文档编号
Relationship Diagnosis As HCC.SQL.Document.Diagnosis [ Cardinality = parent, Inverse = Deaths, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="DeathDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>diag</Value>
</Value>
<Value name="3">
<Value>code</Value>
</Value>
<Value name="4">
<Value>name</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Deaths")</DataLocation>
<DefaultData>DeathDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.DiagnosisC("Deaths")</IdLocation>
<IndexLocation>^HCC.SQL.Document.DiaA237.DeathI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.DiaA237.DeathS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
