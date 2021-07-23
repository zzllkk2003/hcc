/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 手术操作章节
Class HCC.SQL.Document.Procedure Extends (%Persistent, %XML.Adaptor)
{

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(ukDocNo);

/// 手术/操作代码
Property procedure As WS.DE.DE060009300 [ SqlFieldName = procedure ];

/// 手术名称
Property procedureName As WS.DE.DE060009400 [ SqlFieldName = procedure_name ];

/// 手术级别
Property procedureClass As WS.DE.DE060025500 [ SqlFieldName = procedure_class ];

/// 操作日期/时间
Property procedureTime As WS.DE.DE060009500 [ SqlFieldName = procedure_time ];

/// 手术医生姓名
Property procedureDoctor As WS.DE.DE020103900 [ SqlFieldName = procedure_doctor ];

/// 第一助手姓名
Property primaryAssistant As WS.DE.DE020103900 [ SqlFieldName = primary_assistant ];

/// 第二助手姓名
Property secondAssistant As WS.DE.DE020103900 [ SqlFieldName = second_assistant ];

/// 手术切口级别
Property cutLevel As WS.DE.DE060025500 [ SqlFieldName = cut_level ];

/// 手术切口愈合等级
Property healingLevel As WS.DE.DE060025500 [ SqlFieldName = healing_level ];

/// 麻醉方法代码
Property anesthesiaMethod As WS.DE.DE060025500 [ SqlFieldName = anesthesia_method ];

/// 麻醉医生姓名
Property anesthesiaDoctor As WS.DE.DE020103900 [ SqlFieldName = anesthesia_doctor ];

Storage Default
{
<Data name="ProcedureDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>procedure</Value>
</Value>
<Value name="3">
<Value>procedureName</Value>
</Value>
<Value name="4">
<Value>procedureClass</Value>
</Value>
<Value name="5">
<Value>procedureTime</Value>
</Value>
<Value name="6">
<Value>procedureDoctor</Value>
</Value>
<Value name="7">
<Value>primaryAssistant</Value>
</Value>
<Value name="8">
<Value>secondAssistant</Value>
</Value>
<Value name="9">
<Value>cutLevel</Value>
</Value>
<Value name="10">
<Value>healingLevel</Value>
</Value>
<Value name="11">
<Value>anesthesiaMethod</Value>
</Value>
<Value name="12">
<Value>anesthesiaDoctor</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.ProcedureD</DataLocation>
<DefaultData>ProcedureDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.ProcedureD</IdLocation>
<IndexLocation>^HCC.SQL.Document.ProcedureI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.ProcedureS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
