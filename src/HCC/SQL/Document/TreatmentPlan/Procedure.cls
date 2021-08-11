/// 治疗计划章节 - 拟实施手术及操作子表
Class HCC.SQL.Document.TreatmentPlan.Procedure Extends (%Persistent, %XML.Adaptor)
{

/// 文档编号
Relationship treatmentPlan As HCC.SQL.Document.TreatmentPlan [ Cardinality = parent, Inverse = procedures, SqlFieldName = DocumentNo ];

/// 拟实施手术及操作编码
Property code As WS.DE.DE060009300 [ SqlFieldName = code ];

/// 拟实施手术及操作名称
Property name As WS.DE.DE060009400 [ SqlFieldName = name ];

/// 手术间编号
Property procedureRoom As WS.DE.DE060025600 [ SqlFieldName = procedure_room ];

/// 拟实施手术时间
Property time As WS.DE.DE060022100 [ SqlFieldName = time ];

/// 拟实施手术方式
Property method As WS.DE.DE060030200 [ SqlFieldName = method ];

/// 拟实施手术目标部位名称
Property bodypart As WS.DE.DE060018700 [ SqlFieldName = bodypart ];

/// 手术前的准备
Property prepare As WS.DE.DE060027100 [ SqlFieldName = prepare ];

/// 手术禁忌症
Property contraindication As WS.DE.DE051014100 [ SqlFieldName = contraindication ];

/// 手术指征
Property indication As WS.DE.DE060034000 [ SqlFieldName = indication ];

/// 拟实施麻醉方法代码
Property anesthesiaCode As WS.DE.DE060007300 [ SqlFieldName = anesthesia_code ];

Storage Default
{
<Data name="ProcedureDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>code</Value>
</Value>
<Value name="3">
<Value>procedureRoom</Value>
</Value>
<Value name="4">
<Value>time</Value>
</Value>
<Value name="5">
<Value>method</Value>
</Value>
<Value name="6">
<Value>prepare</Value>
</Value>
<Value name="7">
<Value>contraindication</Value>
</Value>
<Value name="8">
<Value>indication</Value>
</Value>
<Value name="9">
<Value>anesthesiaCode</Value>
</Value>
<Value name="10">
<Value>name</Value>
</Value>
<Value name="11">
<Value>bodypart</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("procedures")</DataLocation>
<DefaultData>ProcedureDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Docu70F6.TreatmentPlanC("procedures")</IdLocation>
<IndexLocation>^HCC.SQL.Document63C8.ProcedureI</IndexLocation>
<StreamLocation>^HCC.SQL.Document63C8.ProcedureS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
