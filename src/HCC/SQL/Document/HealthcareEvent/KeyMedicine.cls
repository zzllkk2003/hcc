/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 卫生事件章节-关键药物子表
Class HCC.SQL.Document.HealthcareEvent.KeyMedicine Extends (%Persistent, %XML.Adaptor)
{

/// 关键药物名称
Property name As WS.DE.DE085002200 [ SqlFieldName = name ];

/// 关键药物用法
Property usage As WS.DE.DE060013600 [ SqlFieldName = usage ];

/// 药物不良反应
Property adverseReaction As WS.DE.DE060012900 [ SqlFieldName = adv_react ];

/// 中药类别
Property TCMType As WS.DE.DE060016400 [ SqlFieldName = TCM_type ];

/// 文档编号
Relationship healthcareEvent As HCC.SQL.Document.HealthcareEvent [ Cardinality = parent, Inverse = keyMedicines, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="KeyMedicineDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>usage</Value>
</Value>
<Value name="4">
<Value>adverseReaction</Value>
</Value>
<Value name="5">
<Value>TCMType</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("KeyMedicines")</DataLocation>
<DefaultData>KeyMedicineDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.HealthcareE7CC8C("KeyMedicines")</IdLocation>
<IndexLocation>^HCC.SQL.Documen2E2.KeyMedicineI</IndexLocation>
<StreamLocation>^HCC.SQL.Documen2E2.KeyMedicineS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
