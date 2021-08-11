/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 高值耗材章节条目表
Class HCC.SQL.Document.HighValueConsumable Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "10160-0";

Parameter SectionName = "HISTORY OF MEDICATION USE";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档号
Relationship DocumentNo As HCC.SQL.Document(XMLPROJECTION = "NONE") [ Cardinality = parent, Inverse = HighValueConsumables ];

/// 使用途径
Property route As WS.DE.DE060024200 [ SqlFieldName = route ];

/// 耗材数量
Property quantity As WS.DE.DE060024100 [ SqlFieldName = quantity ];

/// 耗材单位
Property unit As WS.DE.DE085003400 [ SqlFieldName = unit ];

/// 产品编码
Property productNo As WS.DE.DE085005500 [ SqlFieldName = product_no ];

/// 材料名称
Property name As WS.DE.DE085004400 [ SqlFieldName = name ];

/// 产品生产厂家
Property manufacturer As WS.DE.DE081004200 [ SqlFieldName = manufacturer ];

/// 产品供应商
Property provider As WS.DE.DE085003500 [ SqlFieldName = provider ];

/// 植入性耗材标志
Property implantable As WS.DE.DE085005800 [ SqlFieldName = implantable ];

Storage Default
{
<Data name="HighValueConsumableDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>route</Value>
</Value>
<Value name="3">
<Value>quantity</Value>
</Value>
<Value name="4">
<Value>unit</Value>
</Value>
<Value name="5">
<Value>productNo</Value>
</Value>
<Value name="6">
<Value>name</Value>
</Value>
<Value name="7">
<Value>manufacturer</Value>
</Value>
<Value name="8">
<Value>provider</Value>
</Value>
<Value name="9">
<Value>implantable</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("MedicationAdministered")</DataLocation>
<DefaultData>HighValueConsumableDefaultData</DefaultData>
<IdLocation>^HCC.SQL.DocumentC("MedicationAdministered")</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.HighValueCo4D20I</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.HighValueCo4D20S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
