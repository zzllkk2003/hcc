/// 互联互通文档头-医生签名信息，法定审核者子表
Class HCC.SQL.Document.Header.LegalAuthenticator Extends (%Persistent, %XML.Adaptor)
{

/// 文档编号
Relationship DocumentNo As HCC.SQL.Document.Header [ Cardinality = parent, Inverse = LegalAuthenticators ];

Index DocumentNoIndex On DocumentNo;

/// 签名日期时间
Property time As WS.DE.DE090005300 [ SqlFieldName = time ];

/// 签名代码
Property signatureCode As %String [ SqlFieldName = sig_code ];

/// 签名人指定id
Property assignedEntityId As %String [ SqlFieldName = asgnEnty_id ];

/// 医务人员类别
Property assignedEntityCode As %String(VALUELIST = ",编码员,产程检查者,处方发药药剂师,处方核对药剂师,处方开立医师,处方审核药剂师,处方调配药剂师,代理人,护士,护婴者,患者,会诊申请医疗机构,会诊申请医师,会诊所在机构,会诊医师,记录人,检查技师,检查医师,检验医师,交班者签名,交接护士,接班者签名,接生者,接诊医师,进修医师,科主任,麻醉医师,配偶,器械护士,上级医师,审核医师,实习医师,手术操作者,手术者,巡台护士,医师,医嘱执行者,责任护士,指导者,主持人签名,主任(副主任)医师,主任医师,主治医师,助产者,助手,住院医师,转出医师,转入医师,转运者") [ SqlFieldName = asgnEnty_code ];

/// 签名医生的姓名
Property assignedPersonName As WS.DE.DE020103900 [ SqlFieldName = asgnPers_name ];

Storage Default
{
<Data name="LegalAuthenticatorDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>time</Value>
</Value>
<Value name="3">
<Value>signatureCode</Value>
</Value>
<Value name="4">
<Value>assignedEntityId</Value>
</Value>
<Value name="5">
<Value>assignedEntityCode</Value>
</Value>
<Value name="6">
<Value>assignedPersonName</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("LegalAuthenticators")</DataLocation>
<DefaultData>LegalAuthenticatorDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.HeaderC("LegalAuthenticators")</IdLocation>
<IndexLocation>^HCC.SQL.DoEBE5.LegalAuthenF2DDI</IndexLocation>
<StreamLocation>^HCC.SQL.DoEBE5.LegalAuthenF2DDS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
