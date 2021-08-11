/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 实验室检查 （已作废）
/// 注意，这不是章节类，是实验室检查元素类
/// 不需要实验室检查章节类
Class HCC.SQL.Document.LabTestbackup Extends (%Persistent, %XML.Adaptor)
{

/// 文档号
/// Relationship DocumentNo As HCC.SQL.Document(XMLPROJECTION = "NONE") [ Cardinality = parent, Inverse = LabTests ];
/// 实验室检查类型
/// 用于标识体征类型，使用数据元名，例如DE04.10.188.00
Property type As %String;

/// 实验室检查值
Property value As %String;

/// 检查值-显示值
/// 例如阳性
Property display As %String [ Calculated, SqlComputeCode = {set {*}=##class(WS.DE.Tools).GetValueSetDisplay("WS.DE."_$REPLACE({type},".",""),{value})}, SqlComputed, SqlFieldName = display ];

/// 检查项目名称
/// 例如血常规
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
<Data name="LabTestbackupDefaultData">
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
<DataLocation>^HCC.SQL.Docu70F6.LabTestbackupD</DataLocation>
<DefaultData>LabTestbackupDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Docu70F6.LabTestbackupD</IdLocation>
<IndexLocation>^HCC.SQL.Docu70F6.LabTestbackupI</IndexLocation>
<StreamLocation>^HCC.SQL.Docu70F6.LabTestbackupS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
