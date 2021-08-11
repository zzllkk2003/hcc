/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 用药章节 - 处方条目子表
Class HCC.SQL.Document.MedicationUseHistory.MedicineItem Extends (%Persistent, %XML.Adaptor)
{

/// 用药原因
Property reason As %String(VALUELIST = ",处方,术前,术中") [ InitialExpression = "处方", SqlFieldName = reason ];

/// 药物使用途径代码
Property route As WS.DE.DE060013400 [ SqlFieldName = route ];

/// 单次用药剂量
Property dose As WS.DE.DE085002300 [ SqlFieldName = dose ];

/// 药物使用频率
Property rate As WS.DE.DE060013300 [ SqlFieldName = rate ];

/// 药物剂型代码
Property form As WS.DE.DE085001100 [ SqlFieldName = form ];

/// 药物名称
Property name As WS.DE.DE085002200 [ SqlFieldName = name ];

/// 药物规格
Property spec As WS.DE.DE085004300 [ SqlFieldName = spec ];

/// 药物使用总剂量
Property totalDose As WS.DE.DE060013500 [ SqlFieldName = total_dose ];

/// 文档编号
Relationship MedicationUseHistory As HCC.SQL.Document.MedicationUseHistory [ Cardinality = parent, Inverse = MedicineItems, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="MedicineItemDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>route</Value>
</Value>
<Value name="3">
<Value>dose</Value>
</Value>
<Value name="4">
<Value>rate</Value>
</Value>
<Value name="5">
<Value>unit</Value>
</Value>
<Value name="6">
<Value>name</Value>
</Value>
<Value name="7">
<Value>spec</Value>
</Value>
<Value name="8">
<Value>totalDose</Value>
</Value>
<Value name="9">
<Value>form</Value>
</Value>
<Value name="10">
<Value>reason</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("MedicineItems")</DataLocation>
<DefaultData>MedicineItemDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.MedicationUC801C("MedicineItems")</IdLocation>
<IndexLocation>^HCC.SQL.Docum2600.MedicineItemI</IndexLocation>
<StreamLocation>^HCC.SQL.Docum2600.MedicineItemS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
