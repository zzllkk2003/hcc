/// Author: QP
/// Version: 1.0
/// Date:2021/08
/// 《检查报告》的体格检查章节 - 检查项目条目子表
Class HCC.SQL.Document.ExamReportPhysicalExam.Item Extends (%Persistent, %XML.Adaptor)
{

/// 检查项目代码
Property code As WS.DE.DE043001900 [ SqlFieldName = code ];

/// 检查日期
Property date As WS.DE.DE045014000 [ SqlFieldName = date ];

/// 标本类别
Property type As WS.DE.DE045013400 [ SqlFieldName = spec_type ];

/// 标本采样日期时间
Property collectTime As WS.DE.DE045013700 [ SqlFieldName = spec_coll_time ];

/// 接收标本日期时间
Property receiveTime As WS.DE.DE045014100 [ SqlFieldName = spec_recv_time ];

/// 标本状态
Property specimenStatus As WS.DE.DE045013500 [ SqlFieldName = spec_stat ];

/// 标本固定液名称
Property specimenFixing As WS.DE.DE085002700 [ SqlFieldName = spec_fix ];

/// 检查结果代码
Property resultCode As WS.DE.DE043001700 [ SqlFieldName = result_code ];

/// 检查定量结果
Property value As WS.DE.DE043001500 [ SqlFieldName = value ];

/// 检查/检验计量单位
Property unit As WS.DE.DE043001600 [ SqlFieldName = unit ];

/// 文档编号
Relationship PhyChk As HCC.SQL.Document.ExamReportPhysicalExam [ Cardinality = parent, Inverse = Items, SqlFieldName = DocumentNo ];

Storage Default
{
<Data name="ItemDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>code</Value>
</Value>
<Value name="3">
<Value>date</Value>
</Value>
<Value name="4">
<Value>type</Value>
</Value>
<Value name="5">
<Value>collectTime</Value>
</Value>
<Value name="6">
<Value>receiveTime</Value>
</Value>
<Value name="7">
<Value>specimenStatus</Value>
</Value>
<Value name="8">
<Value>specimenFixing</Value>
</Value>
<Value name="9">
<Value>resultCode</Value>
</Value>
<Value name="10">
<Value>value</Value>
</Value>
<Value name="11">
<Value>unit</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Items")</DataLocation>
<DefaultData>ItemDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.ExamReportP83A2C("Items")</IdLocation>
<IndexLocation>^HCC.SQL.Document.Exam5F23.ItemI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.Exam5F23.ItemS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
