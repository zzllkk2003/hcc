/// Author: QP
/// Version: 1.0
/// Date:2021/07
/// 新生儿章节表
Class HCC.SQL.Document.NewBorn Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "57075-4";

Parameter SectionName = "newborn delivery information";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 新生儿性别代码                                                      
Property gender As WS.DE.DE020104000 [ Required, SqlFieldName = gender ];

/// 新生儿出生体重（g）                                                   
Property weight As WS.DE.DE041001900 [ Required, SqlFieldName = weight ];

/// 新生儿出生身长（cm）                                                  
Property height As WS.DE.DE041001800 [ Required, SqlFieldName = height ];

/// 产瘤大小                                                         
Property size As WS.DE.DE051016800 [ Required, SqlFieldName = size ];

/// 产瘤部位                                                         
Property position As WS.DE.DE051016700 [ Required, SqlFieldName = position ];

Storage Default
{
<Data name="NewBornDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>gender</Value>
</Value>
<Value name="3">
<Value>weight</Value>
</Value>
<Value name="4">
<Value>height</Value>
</Value>
<Value name="5">
<Value>size</Value>
</Value>
<Value name="6">
<Value>position</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.NewBornD</DataLocation>
<DefaultData>NewBornDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.NewBornD</IdLocation>
<IndexLocation>^HCC.SQL.Document.NewBornI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.NewBornS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
