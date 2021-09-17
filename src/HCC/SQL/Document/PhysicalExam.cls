/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 体格检查章节条目
/// 注意，这不是章节类，是体格检查条目类。不需要体格检查章节类
/// 体格检查条目有2个特殊的条目：
/// 1. 一般体格检查结果条目 DE04.10.258.00
/// 2. 一般状况检查结果条目 DE04.10.219.00
/// 这2个条目在C0002和C0010中声明为0..*,但实际用例中都为0..1 (C0003就是如此定义的)
/// 因此这2个条目按其它条目一样对待
/// 而C0006的体格检查章节非常特殊，由独立的章节类实现！！！
Class HCC.SQL.Document.PhysicalExam Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode = "29545-1";

Parameter SectionName = "PHYSICAL EXAMINATION";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档号
Relationship DocumentNo As HCC.SQL.Document(XMLPROJECTION = "NONE") [ Cardinality = parent, Inverse = PhysicalExams ];

/// 体格检查类型。用于标识体征类型，使用数据元名，例如DE04.10.188.00
Property type As %String;

/// 体格检查值
Property value As %String(MAXLEN = 500);

/// 检查项目名称。例如血常规
Property codeSystemName As %String [ Calculated, SqlComputeCode = {set {*}=##class(WS.DE.Tools).GetDataElementDesc("WS.DE."_$REPLACE({type},".",""))}, SqlComputed, SqlFieldName = codeSystem_name ];

/// Property codeSystemName As %String [ SqlComputeCode = {set {codeSystem_name}={type}}, SqlComputed, SqlFieldName = codeSystem_name ];
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
<Data name="PhysicalExamDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>type</Value>
</Value>
<Value name="3">
<Value>value</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("LabTests")</DataLocation>
<DefaultData>PhysicalExamDefaultData</DefaultData>
<IdLocation>^HCC.SQL.DocumentC("LabTests")</IdLocation>
<IndexLocation>^HCC.SQL.Document.PhysicalExamI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.PhysicalExamS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
