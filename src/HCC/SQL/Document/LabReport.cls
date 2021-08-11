/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 检验报告章节表
/// 《检验记录》需要
Class HCC.SQL.Document.LabReport Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode;

Parameter SectionName = "检验报告";

Parameter SectionCodeSystemOID;

Parameter SectionCodeSystem;

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 检验报告结果
Property result As WS.DE.DE045013000 [ SqlFieldName = result ];

/// 检验报告科室
Property dept As WS.DE.DE081002600 [ SqlFieldName = dept ];

/// 检验报告机构名称
Property org As WS.DE.DE081001300 [ SqlFieldName = org ];

/// 检验报告备注
Property notes As WS.DE.DE060017900 [ SqlFieldName = notes ];

Storage Default
{
<Data name="LabReportDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>result</Value>
</Value>
<Value name="3">
<Value>dept</Value>
</Value>
<Value name="4">
<Value>org</Value>
</Value>
<Value name="5">
<Value>notes</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.LabReportD</DataLocation>
<DefaultData>LabReportDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.LabReportD</IdLocation>
<IndexLocation>^HCC.SQL.Document.LabReportI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.LabReportS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
