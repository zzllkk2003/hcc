/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 用药章节 - 中药饮片条目子表
Class HCC.SQL.Document.MedicationUseHistory.HerbalPiece Extends (%Persistent, %XML.Adaptor)
{

/// 中药饮片处方
Property name As WS.DE.DE085004900 [ SqlFieldName = name ];

/// 中药饮片剂数
Property dose As WS.DE.DE085005000 [ SqlFieldName = dose ];

/// 中药饮片煎煮法
Property decocting As WS.DE.DE085004700 [ SqlFieldName = decocting ];

/// 药物用法
Property usage As WS.DE.DE060013600 [ SqlFieldName = usage ];

/// 中药处方医嘱内容。用于《疑难病例讨论记录》,《转科记录》
Property content As WS.DE.DE060028700 [ SqlFieldName = content ];

/// 文档编号
Relationship MedicationUseHistory As HCC.SQL.Document.MedicationUseHistory [ Cardinality = parent, Inverse = HerbalPieces, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="HerbalPieceDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>name</Value>
</Value>
<Value name="3">
<Value>dose</Value>
</Value>
<Value name="4">
<Value>decocting</Value>
</Value>
<Value name="5">
<Value>usage</Value>
</Value>
<Value name="6">
<Value>content</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("HerbalPieces")</DataLocation>
<DefaultData>HerbalPieceDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.MedicationUC801C("HerbalPieces")</IdLocation>
<IndexLocation>^HCC.SQL.Docume2600.HerbalPieceI</IndexLocation>
<StreamLocation>^HCC.SQL.Docume2600.HerbalPieceS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
