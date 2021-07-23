/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 生命体征
/// 注意，这不是章节类，是生命体征元素类
/// 不需要生命体征章节类
Class HCC.SQL.Document.VitalSign Extends (%Persistent, %XML.Adaptor)
{

/// 文档号
Relationship DocumentNo As HCC.SQL.Document(XMLPROJECTION = "NONE") [ Cardinality = parent, Inverse = VitalSigns ];

/// 体征类型
/// 用于标识体征类型，使用数据元名，例如DE04.10.188.00
Property type As %String;

/// 用于区分多个相同的体征项
/// 例如“住院病案首页”中“新生儿入院体重”和“新生儿出生体重”都是DE04.10.019.00
/// 需要将display设置为体征说明，例如“新生儿入院体重”
Property display As %String;

/// 体征值
Property value As %String;

/// 在INSERT/UPDATE时，检查约束
/// 如果约束检查失败，则回滚SQL操作，并将错误原因放入SQLCODE
Trigger INSERTUPDATETrigger [ Event = INSERT/UPDATE ]
{
    Set tType = {type},tValue={value},tErrMsg=""
    Set tOK = ##class(WS.DE.Tools).Validate(tType,tValue,.tErrMsg)
    If tOK=0
    {
        Set %msg=tErrMsg
        Set %ok=0
    }
}

Storage Default
{
<Data name="VitalSignDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>type</Value>
</Value>
<Value name="3">
<Value>value</Value>
</Value>
<Value name="4">
<Value>display</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Document.VitalSignD</DataLocation>
<DefaultData>VitalSignDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.VitalSignD</IdLocation>
<IndexLocation>^HCC.SQL.Document.VitalSignI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.VitalSignS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
