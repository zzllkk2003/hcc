/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 术后去向章节表
Class HCC.SQL.Document.ProcedureDisposition Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "59775-7";

Parameter SectionName = "Procedure disposition";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 患者去向
Property disposition As WS.DE.DE060018500 [ SqlFieldName = disposition ];

/// 出手术室日期时间
Property leaveTime As WS.DE.DE060019100 [ SqlFieldName = leave_time ];

Storage Default
{
<Data name="ProcedureDispositionDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>disposition</Value>
</Value>
<Value name="3">
<Value>leaveTime</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.ProcedureDi599FD</DataLocation>
<DefaultData>ProcedureDispositionDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.ProcedureDi599FD</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.ProcedureDi599FI</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.ProcedureDi599FS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
