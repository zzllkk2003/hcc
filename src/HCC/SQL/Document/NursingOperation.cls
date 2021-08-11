/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 护理操作条目表
/// 注意，这不是章节类，是护理操作条目类。不需要护理操作章节类
Class HCC.SQL.Document.NursingOperation Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode;

Parameter SectionName = "护理操作";

Parameter SectionCodeSystemOID;

Parameter SectionCodeSystem;

/// 文档号
Relationship DocumentNo As HCC.SQL.Document(XMLPROJECTION = "NONE") [ Cardinality = parent, Inverse = NursingOperations ];

/// 护理操作名称
Property operation As WS.DE.DE060034200 [ SqlFieldName = operation ];

/// 护理操作结果
Property result As WS.DE.DE060020900 [ SqlFieldName = result ];

/// 护理操作项目类目名称
Property category As WS.DE.DE060021000 [ SqlFieldName = category ];

/// 呼吸机监护项目
Property Ventilator As WS.DE.DE060020700 [ SqlFieldName = Ventilator ];

Storage Default
{
<Data name="NursingOperationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>operation</Value>
</Value>
<Value name="3">
<Value>result</Value>
</Value>
<Value name="4">
<Value>category</Value>
</Value>
<Value name="5">
<Value>Ventilator</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("NursingOperations")</DataLocation>
<DefaultData>NursingOperationDefaultData</DefaultData>
<IdLocation>^HCC.SQL.DocumentC("NursingOperations")</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.NursingOperD8BEI</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.NursingOperD8BES</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
