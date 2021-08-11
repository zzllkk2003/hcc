/// 主要健康问题章节 - 中医住院病案首页
Class HCC.SQL.Document.HealthProblem.TCM Extends (%SerialObject, %XML.Adaptor)
{

/// 治疗类别 DE06.00.304.00
Property treatmenType As WS.DE.DE060030400 [ SqlFieldName = treat_type ];

/// 实施临床路径 HDSD00.12.099
Property clinicalPathway As WS.DE.DE060024700 [ SqlFieldName = clinical_pathway ];

Storage Default
{
<Data name="TCMState">
<Value name="1">
<Value>treatmenType</Value>
</Value>
<Value name="2">
<Value>clinicalPathway</Value>
</Value>
</Data>
<State>TCMState</State>
<StreamLocation>^HCC.SQL.Document.HealtDAD8.TCMS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
