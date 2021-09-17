/// Author: QP
/// Version: 1.0
/// Date:2021/07/08
/// 输血章节表
Class HCC.SQL.Document.BloodTransfusion Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode = "56836-0";

Parameter SectionName = "History of blood transfusion";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 输血量
Property volume As WS.DE.DE060026700 [ SqlFieldName = vol ];

/// 输血量计量单位
Property unit As WS.DE.DE085003600 [ SqlFieldName = unit ];

/// 输血反应标志
Property reaction As WS.DE.DE060026400 [ SqlFieldName = reaction ];

/// 输血反应类型
Property reactionType As WS.DE.DE060026500 [ SqlFieldName = reaction_type ];

/// 输血日期时间
Property beginTime As WS.DE.DE060021800 [ SqlFieldName = begin_time ];

/// 输血停止日期时间
Property endTime As WS.DE.DE060021800 [ SqlFieldName = end_time ];

/// 输血品种代码
Property type As WS.DE.DE085004000 [ SqlFieldName = type ];

/// 输血史标识代码
Property historyMark As WS.DE.DE060010600 [ SqlFieldName = history_mark ];

/// 输血史。用于《入院记录》、《病历概要》
Property history As WS.DE.DE021010000 [ SqlFieldName = history ];

/// 输血性质代码
Property property As WS.DE.DE045014700 [ SqlFieldName = property ];

/// 申请ABO血型代码
Property ABOType As WS.DE.DE045000100 [ SqlFieldName = ABO_type ];

/// 申请Rh血型代码
Property RhType As WS.DE.DE045001000 [ SqlFieldName = Rh_type ];

/// 输血指征
Property trigger As WS.DE.DE060034000 [ SqlFieldName = trigger ];

/// 输血过程记录
Property notes As WS.DE.DE060018100 [ SqlFieldName = notes ];

/// 血袋编码
Property bagNo As WS.DE.DE010002300 [ SqlFieldName = bag_no ];

/// 输血次数
Property times As WS.DE.DE060026300 [ SqlFieldName = times ];

/// 输血原因
Property reason As WS.DE.DE060010700 [ SqlFieldName = reason ];

Storage Default
{
<Data name="BloodTransfusionDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>volume</Value>
</Value>
<Value name="3">
<Value>unit</Value>
</Value>
<Value name="4">
<Value>reaction</Value>
</Value>
<Value name="5">
<Value>reactionType</Value>
</Value>
<Value name="6">
<Value>beginTime</Value>
</Value>
<Value name="7">
<Value>endTime</Value>
</Value>
<Value name="8">
<Value>type</Value>
</Value>
<Value name="9">
<Value>historyMark</Value>
</Value>
<Value name="10">
<Value>history</Value>
</Value>
<Value name="11">
<Value>property</Value>
</Value>
<Value name="12">
<Value>ABOType</Value>
</Value>
<Value name="13">
<Value>RhType</Value>
</Value>
<Value name="14">
<Value>trigger</Value>
</Value>
<Value name="15">
<Value>notes</Value>
</Value>
<Value name="16">
<Value>bagNo</Value>
</Value>
<Value name="17">
<Value>times</Value>
</Value>
<Value name="18">
<Value>reason</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.BloodTransf9B62D</DataLocation>
<DefaultData>BloodTransfusionDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.BloodTransf9B62D</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.BloodTransf9B62I</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.BloodTransf9B62S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
