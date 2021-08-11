/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 护理记录章节表
Class HCC.SQL.Document.NursingRecord Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "X-NN";

Parameter SectionName = "Nursing Note";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 护理等级代码
Property nursingLevel As WS.DE.DE060021100 [ SqlFieldName = nursing_level ];

/// 护理类型代码
Property nursingType As WS.DE.DE060021200 [ SqlFieldName = nursing_type ];

/// 导管护理描述
Property catheterNurse As WS.DE.DE060020900 [ SqlFieldName = catheter_nurse ];

/// 气管护理代码
Property tracheaNurse As WS.DE.DE060022900 [ SqlFieldName = trachea_nurse ];

/// 体位护理
Property positionNurse As WS.DE.DE041025900 [ SqlFieldName = position_nurse ];

/// 皮肤护理
Property skinNurse As WS.DE.DE045006800 [ SqlFieldName = skin_nurse ];

/// 营养护理
Property nutritionNurse As WS.DE.DE060029200 [ SqlFieldName = nutrition_nurse ];

/// 心理护理代码
Property psychologyNurse As WS.DE.DE060028300 [ SqlFieldName = psychology_nurse ];

/// 安全护理代码
Property saftyNurse As WS.DE.DE060017800 [ SqlFieldName = safty_nurse ];

/// 护理问题
Property problem As WS.DE.DE051013600 [ SqlFieldName = problem ];

/// 护理操作名称。用于《护理计划》需要，为何不放在”护理操作章节“？
Property operation As WS.DE.DE060034200 [ SqlFieldName = operation ];

/// 护理操作结果。用于《护理计划》需要，为何不放在”护理操作章节“？
Property result As WS.DE.DE060020900 [ SqlFieldName = result ];

/// 护理操作项目类目名称。用于《护理计划》需要，为何不放在”护理操作章节“？
Property category As WS.DE.DE060021000 [ SqlFieldName = category ];

Storage Default
{
<Data name="NursingRecordDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>nursingLevel</Value>
</Value>
<Value name="3">
<Value>nursingType</Value>
</Value>
<Value name="4">
<Value>catheterNurse</Value>
</Value>
<Value name="5">
<Value>tracheaNurse</Value>
</Value>
<Value name="6">
<Value>positionNurse</Value>
</Value>
<Value name="7">
<Value>skinNurse</Value>
</Value>
<Value name="8">
<Value>nutritionNurse</Value>
</Value>
<Value name="9">
<Value>psychologyNurse</Value>
</Value>
<Value name="10">
<Value>saftyNurse</Value>
</Value>
<Value name="11">
<Value>problem</Value>
</Value>
<Value name="12">
<Value>operation</Value>
</Value>
<Value name="13">
<Value>result</Value>
</Value>
<Value name="14">
<Value>category</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Docu70F6.NursingRecordD</DataLocation>
<DefaultData>NursingRecordDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Docu70F6.NursingRecordD</IdLocation>
<IndexLocation>^HCC.SQL.Docu70F6.NursingRecordI</IndexLocation>
<StreamLocation>^HCC.SQL.Docu70F6.NursingRecordS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
