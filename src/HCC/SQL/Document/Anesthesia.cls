/// Author: QP
/// Version: 1.0
/// Date:2021/07/08
/// 麻醉章节表
Class HCC.SQL.Document.Anesthesia Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "59774-0";

Parameter SectionName = "Procedure anesthesia";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 麻醉方式代码
Property method As WS.DE.DE060007300 [ SqlFieldName = method ];

/// 麻醉开始日期时间
Property beginTime As WS.DE.DE060009500 [ SqlFieldName = begin_time ];

/// 美国麻醉医师协会分级标准代码(ASA)
Property ASA As WS.DE.DE051012900 [ SqlFieldName = ASA ];

/// 气管插管分类
Property intubation As WS.DE.DE060022800 [ SqlFieldName = intubation ];

/// 麻醉药物名称
Property anesthetic As WS.DE.DE085002200 [ SqlFieldName = anesthetic ];

/// 麻醉体位
Property position As WS.DE.DE041026000 [ SqlFieldName = pos ];

/// 呼吸类型代码
Property breathingType As WS.DE.DE060020800 [ SqlFieldName = breath_type ];

/// 麻醉描述
Property notes As WS.DE.DE060022600 [ SqlFieldName = notes ];

/// 麻醉合并症标志
Property complication As WS.DE.DE050107700 [ SqlFieldName = complication ];

/// 穿刺过程描述
Property puncture As WS.DE.DE051006300 [ SqlFieldName = puncture ];

/// 麻醉效果
Property effect As WS.DE.DE060025300 [ SqlFieldName = effect ];

/// 麻醉前用药
Property premedication As WS.DE.DE060013600 [ SqlFieldName = premedication ];

/// 麻醉医师姓名
Property anesthetist As WS.DE.DE020103900 [ SqlFieldName = anesthetist ];

Storage Default
{
<Data name="AnesthesiaDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>method</Value>
</Value>
<Value name="3">
<Value>anesthetist</Value>
</Value>
<Value name="4">
<Value>beginTime</Value>
</Value>
<Value name="5">
<Value>ASA</Value>
</Value>
<Value name="6">
<Value>intubation</Value>
</Value>
<Value name="7">
<Value>anesthetic</Value>
</Value>
<Value name="8">
<Value>position</Value>
</Value>
<Value name="9">
<Value>breathingType</Value>
</Value>
<Value name="10">
<Value>notes</Value>
</Value>
<Value name="11">
<Value>complication</Value>
</Value>
<Value name="12">
<Value>puncture</Value>
</Value>
<Value name="13">
<Value>effect</Value>
</Value>
<Value name="14">
<Value>premedication</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.AnesthesiaD</DataLocation>
<DefaultData>AnesthesiaDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.AnesthesiaD</IdLocation>
<IndexLocation>^HCC.SQL.Document.AnesthesiaI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.AnesthesiaS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
