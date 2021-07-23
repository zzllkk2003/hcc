/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 主要健康问题章节
Class HCC.SQL.Document.HealthProblem Extends (%Persistent, %XML.Adaptor)
{

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(ukDocNo);

/// 住院者疾病状态代码
/// Property sickCondition As WS.DE.DE051011900 [ SqlFieldName = sick_condition ];
Property sickCondition As WS.DE.DE050107200 [ SqlFieldName = sick_condition ];

/// 住院患者损伤和中毒外部原因
Property damageReason As WS.DE.DE051015200 [ SqlFieldName = damage_reason ];

/// 损伤和中毒的外部原因 - 疾病编码
Property damageDiag As WS.DE.DE050107800 [ SqlFieldName = damage_diag ];

/// 颅脑损伤患者入院前昏迷时间 
Property comaBeforeAdmit As HCC.SQL.Document.HealthProblem.ComaBeforeAdmit;

/// 颅脑损伤患者入院后昏迷时间 
Property comaAfterAdmit As HCC.SQL.Document.HealthProblem.ComaAfterAdmit;

Storage Default
{
<Data name="HealthProblemDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>sickCondition</Value>
</Value>
<Value name="3">
<Value>damageReason</Value>
</Value>
<Value name="4">
<Value>damageDiag</Value>
</Value>
<Value name="5">
<Value>comaDays</Value>
</Value>
<Value name="6">
<Value>comaHours</Value>
</Value>
<Value name="7">
<Value>comaMinutes</Value>
</Value>
<Value name="8">
<Value>comaBeforeAdmit</Value>
</Value>
<Value name="9">
<Value>comaAfterAdmit</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Docu70F6.HealthProblemD</DataLocation>
<DefaultData>HealthProblemDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Docu70F6.HealthProblemD</IdLocation>
<IndexLocation>^HCC.SQL.Docu70F6.HealthProblemI</IndexLocation>
<StreamLocation>^HCC.SQL.Docu70F6.HealthProblemS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
