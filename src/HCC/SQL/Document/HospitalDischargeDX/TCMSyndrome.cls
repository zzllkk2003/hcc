/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 出院中医诊断-主证子表
Class HCC.SQL.Document.HospitalDischargeDX.TCMSyndrome Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

/// 中医主证
Property syndrome As HCC.SQL.Document.TCMDiagItem [ SqlFieldName = syndrome ];

/// 中医入院病情
Property sickCondition As WS.DE.DE090010400 [ Required, SqlFieldName = sick_cond ];

/// 文档编号
Relationship HospitalDischargeDX As HCC.SQL.Document.HospitalDischargeDX [ Cardinality = parent, Inverse = TCMSyndrome, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="TCMSyndromeDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>syndromeName</Value>
</Value>
<Value name="3">
<Value>syndromeCode</Value>
</Value>
<Value name="4">
<Value>syndrome</Value>
</Value>
<Value name="5">
<Value>sickCondition</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("TCMSyndrome")</DataLocation>
<DefaultData>TCMSyndromeDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.HospitalDisC1A4C("TCMSyndrome")</IdLocation>
<IndexLocation>^HCC.SQL.DocumeC1CC.TCMSyndromeI</IndexLocation>
<StreamLocation>^HCC.SQL.DocumeC1CC.TCMSyndromeS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
