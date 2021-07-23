/// 住院过程章节
Class HCC.SQL.Document.HospitalizationProcess Extends (%Persistent, %XML.Adaptor)
{

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(ukDocNo);

/// 住院天数
Property staydays As WS.DE.DE060031000 [ SqlFieldName = staydays ];

/// 住院患者出院病房
Property dischargeWard As WS.DE.DE010001900 [ SqlFieldName = discharge_ward ];

/// 住院患者科室名称
Property dischargeDepartment As WS.DE.DE081002600 [ SqlFieldName = discharge_department ];

Storage Default
{
<Data name="HospitalizationProcessDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>hospitalizationCount</Value>
</Value>
<Value name="3">
<Value>staydays</Value>
</Value>
<Value name="4">
<Value>ward</Value>
</Value>
<Value name="5">
<Value>department</Value>
</Value>
<Value name="6">
<Value>dischargeWard</Value>
</Value>
<Value name="7">
<Value>dischargeDepartment</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.Hospitaliza7174D</DataLocation>
<DefaultData>HospitalizationProcessDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.Hospitaliza7174D</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.Hospitaliza7174I</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.Hospitaliza7174S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
