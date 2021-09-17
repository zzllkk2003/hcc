/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 症状章节条目表
/// 涵盖《检查报告》、《入院评估》
Class HCC.SQL.Document.Symptom Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode = "11450-4";

Parameter SectionName = "PROBLEM LIST";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档号
Relationship DocumentNo As HCC.SQL.Document(XMLPROJECTION = "NONE") [ Cardinality = parent, Inverse = Symptoms ];

/// 症状描述
Property symptomDesc As WS.DE.DE040111700 [ SqlFieldName = symptom_desc ];

/// 症状名称
Property symptomName As WS.DE.DE040111800 [ SqlFieldName = symptom_name ];

/// 症状停止日期时间
Property endTime As WS.DE.DE060021800 [ SqlFieldName = end_time ];

/// 症状开始日期时间
Property beginTime As WS.DE.DE060022100 [ SqlFieldName = begin_time ];

Storage Default
{
<Data name="SymptomDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>symptom</Value>
</Value>
<Value name="3">
<Value>endTime</Value>
</Value>
<Value name="4">
<Value>beginTime</Value>
</Value>
<Value name="5">
<Value>symptomDesc</Value>
</Value>
<Value name="6">
<Value>symptomName</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.SymptomD</DataLocation>
<DefaultData>SymptomDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.SymptomD</IdLocation>
<IndexLocation>^HCC.SQL.Document.SymptomI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.SymptomS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
