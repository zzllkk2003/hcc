/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 护理观察章节条目表
Class HCC.SQL.Document.NursingObservation Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode;

Parameter SectionName = "护理观察章节";

Parameter SectionCodeSystemOID;

Parameter SectionCodeSystem;

/// 文档号
Relationship DocumentNo As HCC.SQL.Document(XMLPROJECTION = "NONE") [ Cardinality = parent, Inverse = NursingObservations ];

/// 简要病情
Property briefCondition As WS.DE.DE060018100 [ SqlFieldName = brief_condition ];

/// 护理观察项目名称
Property item As WS.DE.DE021003100 [ SqlFieldName = item ];

/// 护理观察结果
Property result As WS.DE.DE021002800 [ SqlFieldName = result ];

Storage Default
{
<Data name="NursingObservationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>briefCondition</Value>
</Value>
<Value name="3">
<Value>item</Value>
</Value>
<Value name="4">
<Value>result</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.NursingObseF4AED</DataLocation>
<DefaultData>NursingObservationDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.NursingObseF4AED</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.NursingObseF4AEI</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.NursingObseF4AES</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
