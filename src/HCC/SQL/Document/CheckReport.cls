/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 检查报告章节表
/// 《检查记录》需要
Class HCC.SQL.Document.CheckReport Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode;

Parameter SectionName = "检查报告";

Parameter SectionCodeSystemOID;

Parameter SectionCodeSystem;

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 检查报告结果-客观所见
Property objective As WS.DE.DE045013100 [ SqlFieldName = obj ];

/// 检查报告结果-主观提示
Property subjective As WS.DE.DE045013200 [ SqlFieldName = sub ];

/// 检查报告科室
Property dept As WS.DE.DE081002600 [ SqlFieldName = dept ];

/// 检查报告机构名称
Property org As WS.DE.DE081001300 [ SqlFieldName = org ];

/// 检查报告备注
Property notes As WS.DE.DE060017900 [ SqlFieldName = notes ];

Storage Default
{
<Data name="CheckReportDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>objective</Value>
</Value>
<Value name="3">
<Value>subjective</Value>
</Value>
<Value name="4">
<Value>dept</Value>
</Value>
<Value name="5">
<Value>org</Value>
</Value>
<Value name="6">
<Value>notes</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.CheckReportD</DataLocation>
<DefaultData>CheckReportDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.CheckReportD</IdLocation>
<IndexLocation>^HCC.SQL.Document.CheckReportI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.CheckReportS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
