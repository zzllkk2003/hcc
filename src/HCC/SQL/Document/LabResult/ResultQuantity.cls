/// 检验定量结果
/// 用于实验室检查章节
Class HCC.SQL.Document.LabResult.ResultQuantity Extends (%SerialObject, %XML.Adaptor, HCC.SQL.Base)
{

/// 检验定量结果
Property value As WS.DE.DE043001500 [ SqlFieldName = value ];

/// 检查/检验计量单位
Property unit As WS.DE.DE043001600 [ SqlFieldName = unit ];

Storage Default
{
<Data name="ResultQuantityState">
<Value name="1">
<Value>value</Value>
</Value>
<Value name="2">
<Value>unit</Value>
</Value>
</Data>
<State>ResultQuantityState</State>
<StreamLocation>^HCC.SQL.DocA367.ResultQuantityS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
