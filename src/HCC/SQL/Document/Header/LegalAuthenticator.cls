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

/// 患者的住院医师
Property assignedEntityCode As %String [ SqlFieldName = asgnEnty_code ];

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
<DataLocation>{%%PARENT}("Authenticators")</DataLocation>
<DefaultData>LegalAuthenticatorDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.HeaderC("Authenticators")</IdLocation>
<IndexLocation>^HCC.SQL.DoEBE5.LegalAuthenF2DDI</IndexLocation>
<StreamLocation>^HCC.SQL.DoEBE5.LegalAuthenF2DDS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
