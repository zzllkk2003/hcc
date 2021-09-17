/// Author: QP
/// Version: 1.0
/// Date:2021/07
/// 术后交接章节表
Class HCC.SQL.Document.PostoperationHandover Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode = "8648-8";

Parameter SectionName = "Hospital Course";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 病人交接核对项目 DE06.00.206.00
Property verified As WS.DE.DE060020600 [ Required, SqlFieldName = verified ];

/// 交接日期时间：DE09.00.107.00
Property time As WS.DE.DE090010700 [ Required, SqlFieldName = time ];

/// 交接护士签名：DE02.01.039.00
Property nurseName As WS.DE.DE020103900 [ SqlFieldName = nurse_name ];

/// 转运者签名：DE02.01.039.00
Property transporter As WS.DE.DE020103900 [ SqlFieldName = transporter ];

Storage Default
{
<Data name="PostoperationHandoverDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>verified</Value>
</Value>
<Value name="3">
<Value>time</Value>
</Value>
<Value name="4">
<Value>nurseName</Value>
</Value>
<Value name="5">
<Value>transporter</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.Postoperati7B44D</DataLocation>
<DefaultData>PostoperationHandoverDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.Postoperati7B44D</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.Postoperati7B44I</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.Postoperati7B44S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
