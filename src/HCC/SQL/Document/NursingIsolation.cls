/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 护理隔离章节表
Class HCC.SQL.Document.NursingIsolation Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode;

Parameter SectionName = "护理隔离";

Parameter SectionCodeSystemOID;

Parameter SectionCodeSystem;

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 隔离标志
Property isolation As WS.DE.DE060020100 [ SqlFieldName = isolation ];

/// 隔离种类代码
Property isolationType As WS.DE.DE060020200 [ SqlFieldName = isolation_type ];

Storage Default
{
<Data name="NursingIsolationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>isolation</Value>
</Value>
<Value name="3">
<Value>isolationType</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.NursingIsolD37CD</DataLocation>
<DefaultData>NursingIsolationDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.NursingIsolD37CD</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.NursingIsolD37CI</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.NursingIsolD37CS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
