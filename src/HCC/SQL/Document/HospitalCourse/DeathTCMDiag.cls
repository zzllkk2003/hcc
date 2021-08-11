/// 死亡诊断-中医条目表
Class HCC.SQL.Document.HospitalCourse.DeathTCMDiag Extends (%Persistent, %XML.Adaptor)
{

/// 中医病
Property TCMDiag As HCC.SQL.Document.TCMDiagItem [ SqlFieldName = TCMdiag ];

/// 中医症候
Property syndrome As HCC.SQL.Document.TCMDiagItem [ SqlFieldName = syndrome ];

/// 文档编号
Relationship HospitalCourse As HCC.SQL.Document.HospitalCourse [ Cardinality = parent, Inverse = TCMDiags, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="DeathTCMDiagDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>TCMDiag</Value>
</Value>
<Value name="3">
<Value>syndrome</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("TCMDiags")</DataLocation>
<DefaultData>DeathTCMDiagDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Doc70F6.HospitalCourseC("TCMDiags")</IdLocation>
<IndexLocation>^HCC.SQL.Docum30F1.DeathTCMDiagI</IndexLocation>
<StreamLocation>^HCC.SQL.Docum30F1.DeathTCMDiagS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
