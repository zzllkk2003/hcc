/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 生活方式章节表
Class HCC.SQL.Document.LifeStyle Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode;

Parameter SectionName = "生活方式";

Parameter SectionCodeSystemOID;

Parameter SectionCodeSystem;

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 吸烟标志                                                  
Property smoke As WS.DE.DE030007000 [ Required, SqlFieldName = smoke ];

/// 吸烟状况代码                                                       
Property smokeStatus As WS.DE.DE030007300 [ Required, SqlFieldName = smoke_status ];

/// 日吸烟量（支）                                                         
Property smokeQuantity As WS.DE.DE030005300 [ Required, SqlFieldName = smoke_quantity ];

/// 停止吸烟天数                                                      
Property stopSmokeDays As WS.DE.DE030006500 [ Required, SqlFieldName = stop_smoke_days ];

/// 饮酒标志                                                      
Property liquor As WS.DE.DE030003000 [ Required, SqlFieldName = liquor ];

/// 饮酒频率代码                                                      
Property liquorFrequency As WS.DE.DE030007600 [ Required, SqlFieldName = liquor_frequency ];

/// 日饮酒量（mL）                                                      
Property liquorVolume As WS.DE.DE030005400 [ Required, SqlFieldName = liquor_volume ];

/// 饮食情况代码                                                      
Property diet As WS.DE.DE030008000 [ Required, SqlFieldName = diet ];

Storage Default
{
<Data name="LifeStyleDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>smoke</Value>
</Value>
<Value name="3">
<Value>smokeStatus</Value>
</Value>
<Value name="4">
<Value>smokeQuantity</Value>
</Value>
<Value name="5">
<Value>stopSmokeDays</Value>
</Value>
<Value name="6">
<Value>liquor</Value>
</Value>
<Value name="7">
<Value>liquorFrequency</Value>
</Value>
<Value name="8">
<Value>liquorVolume</Value>
</Value>
<Value name="9">
<Value>diet</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.LifeStyleD</DataLocation>
<DefaultData>LifeStyleDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.LifeStyleD</IdLocation>
<IndexLocation>^HCC.SQL.Document.LifeStyleI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.LifeStyleS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
