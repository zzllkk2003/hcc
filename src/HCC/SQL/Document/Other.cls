/// 其他相关信息章节表
Class HCC.SQL.Document.Other Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode;

Parameter SectionName = "其他相关信息";

Parameter SectionCodeSystemOID;

Parameter SectionCodeSystem;

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 注意事项
Property notes As WS.DE.DE090011900 [ SqlFieldName = notes ];

/// 患者去向
Property dischargeTarget As WS.DE.DE060018500 [ SqlFieldName = dchg_tgt ];

Storage Default
{
<Data name="OtherDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>notes</Value>
</Value>
<Value name="3">
<Value>dischargeTarget</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.OtherD</DataLocation>
<DefaultData>OtherDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.OtherD</IdLocation>
<IndexLocation>^HCC.SQL.Document.OtherI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.OtherS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
