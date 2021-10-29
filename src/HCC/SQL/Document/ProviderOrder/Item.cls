/// Author: QP
/// Version: 1.0
/// Date:2021/07
/// 医嘱条目子表
/// 注意，这不是章节类，是医嘱条目类
Class HCC.SQL.Document.ProviderOrder.Item Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

/// 文档号
Relationship ProviderOrder As HCC.SQL.Document.ProviderOrder(XMLPROJECTION = "NONE") [ Cardinality = parent, Inverse = Items, SqlFieldName = DocumentNo ];

/// 医嘱项目类型
Property orderType As WS.DE.DE060028900 [ SqlFieldName = order_type ];

/// 医嘱项目
Property orderItem As WS.DE.DE060028800 [ SqlFieldName = order_item ];

/// 医嘱计划开始时间
Property plannedBeginTime As WS.DE.DE060022200 [ SqlFieldName = planned_begin ];

/// 医嘱计划结束时间
Property plannedEndTime As WS.DE.DE060021900 [ SqlFieldName = planned_end ];

/// 医嘱执行
Property exec As HCC.SQL.Document.ProviderOrder.Item.Exec [ SqlFieldName = exec ];

/// 医嘱开立
Property place As HCC.SQL.Document.ProviderOrder.Item.Place [ SqlFieldName = place ];

/// 医嘱审核
Property review As HCC.SQL.Document.ProviderOrder.Item.Review [ SqlFieldName = review ];

/// 医嘱取消
Property cancel As HCC.SQL.Document.ProviderOrder.Item.Cancel [ SqlFieldName = cancel ];

/// 医嘱核对
Property verify As HCC.SQL.Document.ProviderOrder.Item.Verify [ SqlFieldName = verify ];

/// 医嘱停止
Property terminate As HCC.SQL.Document.ProviderOrder.Item.Terminate [ SqlFieldName = terminate ];

/// 医嘱备注信息
Property notes As WS.DE.DE060017900 [ SqlFieldName = notes ];

/// 电子申请单编号
Property eApplyNo As WS.DE.DE010000800 [ SqlFieldName = eApplyNo ];

/// 处方药品组号
Property groupNo As WS.DE.DE085005600 [ SqlFieldName = groupNo ];

Storage Default
{
<Data name="ItemDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>orderType</Value>
</Value>
<Value name="3">
<Value>orderItem</Value>
</Value>
<Value name="4">
<Value>dischargeOrder</Value>
</Value>
<Value name="5">
<Value>plannedBeginTime</Value>
</Value>
<Value name="6">
<Value>plannedEndTime</Value>
</Value>
<Value name="7">
<Value>execTime</Value>
</Value>
<Value name="8">
<Value>executor</Value>
</Value>
<Value name="9">
<Value>execDept</Value>
</Value>
<Value name="10">
<Value>orderTime</Value>
</Value>
<Value name="11">
<Value>placer</Value>
</Value>
<Value name="12">
<Value>placerDept</Value>
</Value>
<Value name="13">
<Value>verifyTime</Value>
</Value>
<Value name="14">
<Value>verifier</Value>
</Value>
<Value name="15">
<Value>cancelTime</Value>
</Value>
<Value name="16">
<Value>canceller</Value>
</Value>
<Value name="17">
<Value>notes</Value>
</Value>
<Value name="18">
<Value>status</Value>
</Value>
<Value name="19">
<Value>exec</Value>
</Value>
<Value name="20">
<Value>place</Value>
</Value>
<Value name="21">
<Value>review</Value>
</Value>
<Value name="22">
<Value>cancel</Value>
</Value>
<Value name="23">
<Value>verify</Value>
</Value>
<Value name="24">
<Value>terminate</Value>
</Value>
<Value name="25">
<Value>eApplyNo</Value>
</Value>
<Value name="26">
<Value>groupNo</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Items")</DataLocation>
<DefaultData>ItemDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Docu70F6.ProviderOrderC("Items")</IdLocation>
<IndexLocation>^HCC.SQL.Document.Prov606D.ItemI</IndexLocation>
<StreamLocation>^HCC.SQL.Document.Prov606D.ItemS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
