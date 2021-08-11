/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 用药管理章节-条目表
Class HCC.SQL.Document.MedicationAdministered Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "18610-6";

Parameter SectionName = "MEDICATION ADMINISTERED";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档号
Relationship DocumentNo As HCC.SQL.Document(XMLPROJECTION = "NONE") [ Cardinality = parent, Inverse = MedicationAdministereds ];

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

/// 药物用法
Property usage As WS.DE.DE060013600 [ SqlFieldName = usage ];

/// 中药使用类别代码
Property TCMUsage As WS.DE.DE060016400 [ SqlFieldName = TCM_usage ];

/// 药物使用剂量单位
Property unit As WS.DE.DE085002400 [ SqlFieldName = unit ];

/// 药物使用总剂量
Property totalDose As WS.DE.DE060013500 [ SqlFieldName = total_dose ];

Storage Default
{
<Data name="MedicationAdministeredDefaultData">
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
<Value>form</Value>
</Value>
<Value name="6">
<Value>name</Value>
</Value>
<Value name="7">
<Value>usage</Value>
</Value>
<Value name="8">
<Value>TCMUsage</Value>
</Value>
<Value name="9">
<Value>unit</Value>
</Value>
<Value name="10">
<Value>totalDose</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("MedicationAdministered")</DataLocation>
<DefaultData>MedicationAdministeredDefaultData</DefaultData>
<IdLocation>^HCC.SQL.DocumentC("MedicationAdministered")</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.MedicationA66AAI</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.MedicationA66AAS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
