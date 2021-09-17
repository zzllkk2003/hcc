/// 检验条目子表
Class HCC.SQL.Document.LabTest.Item Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

/// 文档编号
Relationship LabTest As HCC.SQL.Document.LabTest [ Cardinality = parent, Inverse = Items, SqlFieldName = DocumentNo ];

/// 检验项目名称
Property name As WS.DE.DE043002000 [ SqlFieldName = name ];

/// 检验项目代码
Property code As WS.DE.DE043001900 [ SqlFieldName = code ];

/// 检验日期
Property date As WS.DE.DE045014000 [ SqlFieldName = date ];

/// 标本
Property specimen As HCC.SQL.Document.Specimen [ SqlFieldName = specimen ];

/// 标本状态
Property specimenStatus As WS.DE.DE045013500 [ SqlFieldName = specimen_stat ];

/// 检验结果
Property result As WS.DE.DE043000900 [ SqlFieldName = result ];

/// 检验结果代码
Property resultCode As WS.DE.DE045013500 [ SqlFieldName = result_code ];

/// 检验定量结果
Property resultQuantity As HCC.SQL.Document.LabResult.ResultQuantity [ SqlFieldName = result_qty ];

Storage Default
{
<Data name="ItemDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>code</Value>
</Value>
<Value name="3">
<Value>specimen</Value>
</Value>
<Value name="4">
<Value>specimenStatus</Value>
</Value>
<Value name="5">
<Value>resultCode</Value>
</Value>
<Value name="6">
<Value>resultQuantity</Value>
</Value>
<Value name="7">
<Value>result</Value>
</Value>
<Value name="8">
<Value>name</Value>
</Value>
<Value name="9">
<Value>date</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.LabTest.ItemD</DataLocation>
<DefaultData>ItemDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.LabTest.ItemD</IdLocation>
<IndexLocation>^HCC.SQL.Document.LabTest.ItemI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.LabTest.ItemS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
