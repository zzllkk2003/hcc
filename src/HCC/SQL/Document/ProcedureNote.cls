/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 手术过程描述章节表
Class HCC.SQL.Document.ProcedureNote Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "8724-7";

Parameter SectionName = "Surgical operation note description";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 手术过程描述
Property notes As WS.DE.DE051006300 [ SqlFieldName = notes ];

/// 手术/操作目标部位名称
Property bodyPartName As WS.DE.DE060018700 [ SqlFieldName = body_part_name ];

/// 介入物名称
Property intervention As WS.DE.DE085003700 [ SqlFieldName = intervention ];

/// 手术体位代码
Property bodyPosition As WS.DE.DE060026000 [ SqlFieldName = body_pos ];

/// 皮肤消毒描述
Property skinDisinfection As WS.DE.DE085005700 [ SqlFieldName = skin_disinfection ];

/// 手术切口描述
Property cutNotes As WS.DE.DE060032100 [ SqlFieldName = cut_notes ];

/// 引流标志
Property drainage As WS.DE.DE051016500 [ SqlFieldName = drainage ];

Storage Default
{
<Data name="ProcedureNoteDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>notes</Value>
</Value>
<Value name="3">
<Value>bodyPartName</Value>
</Value>
<Value name="4">
<Value>intervention</Value>
</Value>
<Value name="5">
<Value>bodyPosition</Value>
</Value>
<Value name="6">
<Value>skinDisinfection</Value>
</Value>
<Value name="7">
<Value>cutNotes</Value>
</Value>
<Value name="8">
<Value>drainage</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Docu70F6.ProcedureNoteD</DataLocation>
<DefaultData>ProcedureNoteDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Docu70F6.ProcedureNoteD</IdLocation>
<IndexLocation>^HCC.SQL.Docu70F6.ProcedureNoteI</IndexLocation>
<StreamLocation>^HCC.SQL.Docu70F6.ProcedureNoteS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
