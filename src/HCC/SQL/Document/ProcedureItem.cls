/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 手术操作条目子表
Class HCC.SQL.Document.ProcedureItem Extends (%Persistent, %XML.Adaptor)
{

/// 文档号
Relationship Procedure As HCC.SQL.Document.Procedure(XMLPROJECTION = "NONE") [ Cardinality = parent, Inverse = Items, SqlFieldName = DocumentNo ];

/// 手术/操作代码
Property code As WS.DE.DE060009300 [ SqlFieldName = code ];

/// 手术名称
Property name As WS.DE.DE060009400 [ SqlFieldName = name ];

/// 操作部位编码。DE06.00.093.00是错误的！
Property bodyPart As WS.DE.DE060018600 [ SqlFieldName = body_part ];

/// 手术/操作目标部位名称
Property bodyPartName As WS.DE.DE060018700 [ SqlFieldName = body_part_name ];

/// 手术体位代码
Property position As WS.DE.DE060026000 [ SqlFieldName = pos ];

/// 介入物名称
Property intervention As WS.DE.DE085003700 [ SqlFieldName = interv ];

/// 操作方法描述
Property operationWay As WS.DE.DE060025100 [ SqlFieldName = oper_way ];

/// 手术/操作次数
Property operationTimes As WS.DE.DE060025000 [ SqlFieldName = oper_times ];

/// 手术级别
Property procedureClass As WS.DE.DE060025500 [ SqlFieldName = procd_class ];

/// 操作日期/时间
Property procedureTime As WS.DE.DE060009500 [ SqlFieldName = procd_time ];

/// 手术医生姓名
Property procedureDoctor As WS.DE.DE020103900 [ SqlFieldName = procd_doc ];

/// 第一助手姓名
Property primaryAssistant As WS.DE.DE020103900 [ SqlFieldName = prim_asst ];

/// 第二助手姓名
Property secondAssistant As WS.DE.DE020103900 [ SqlFieldName = sec_asst ];

/// 器械护士姓名
Property equipmentNurse As WS.DE.DE020103900 [ SqlFieldName = eqp_nurse ];

/// 巡台护士姓名
Property patrolNurse As WS.DE.DE020103900 [ SqlFieldName = patrol_nurse ];

/// 手术切口级别
Property cutLevel As WS.DE.DE060025700 [ SqlFieldName = cut_lvl ];

/// 手术切口愈合等级
Property healingLevel As WS.DE.DE051014700 [ SqlFieldName = healing_lvl ];

/// 麻醉方法代码
Property anesthesiaMethod As WS.DE.DE060007300 [ SqlFieldName = anesth_mthd ];

/// 麻醉医生姓名
Property anesthesiaDoctor As WS.DE.DE020103900 [ SqlFieldName = anesth_doc ];

/// 麻醉观察结果。用于《检查报告》
Property anesthesiaObservation As WS.DE.DE021002800 [ SqlFieldName = anesth_obs ];

/// 麻醉中西医标识代码。用于《检查报告》
Property anesthesiaWay As WS.DE.DE060030700 [ SqlFieldName = anesth_way ];

/// 操作日期/时间
Property beginTime As WS.DE.DE060022100 [ SqlFieldName = begin_time ];

/// 操作日期/时间
Property endTime As WS.DE.DE060021800 [ SqlFieldName = end_time ];

/// 手术间编号
Property room As WS.DE.DE060025600 [ SqlFieldName = room ];

/// 诊疗过程描述
Property notes As WS.DE.DE060029600 [ SqlFieldName = notes ];

/// 术中病理标志。用于《手术护理记录》
Property pathology As WS.DE.DE043006000 [ SqlFieldName = pathology ];

/// 手术准备事项描述。用于《手术护理记录》
Property preparation As WS.DE.DE060031700 [ SqlFieldName = prep ];

/// 入手术室时间。用于《手术护理记录》
Property enterRoomTime As WS.DE.DE060023600 [ SqlFieldName = entr_room_time ];

/// 出手术室日期时间。用于《手术护理记录》
Property leaveRoomTime As WS.DE.DE060019100 [ SqlFieldName = lv_room_time ];

/// 手术过程。用于《术后首次病程记录》、《出院小结》
Property process As WS.DE.DE051006300 [ SqlFieldName = proc ];

Storage Default
{
<Data name="ProcedureItemDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>code</Value>
</Value>
<Value name="3">
<Value>name</Value>
</Value>
<Value name="4">
<Value>bodyPart</Value>
</Value>
<Value name="5">
<Value>bodyPartName</Value>
</Value>
<Value name="6">
<Value>position</Value>
</Value>
<Value name="7">
<Value>intervention</Value>
</Value>
<Value name="8">
<Value>operationWay</Value>
</Value>
<Value name="9">
<Value>operationTimes</Value>
</Value>
<Value name="10">
<Value>procedureClass</Value>
</Value>
<Value name="11">
<Value>procedureTime</Value>
</Value>
<Value name="12">
<Value>procedureDoctor</Value>
</Value>
<Value name="13">
<Value>primaryAssistant</Value>
</Value>
<Value name="14">
<Value>secondAssistant</Value>
</Value>
<Value name="15">
<Value>equipmentNurse</Value>
</Value>
<Value name="16">
<Value>patrolNurse</Value>
</Value>
<Value name="17">
<Value>cutLevel</Value>
</Value>
<Value name="18">
<Value>healingLevel</Value>
</Value>
<Value name="19">
<Value>anesthesiaMethod</Value>
</Value>
<Value name="20">
<Value>anesthesiaDoctor</Value>
</Value>
<Value name="21">
<Value>anesthesiaObservation</Value>
</Value>
<Value name="22">
<Value>anesthesiaWay</Value>
</Value>
<Value name="23">
<Value>beginTime</Value>
</Value>
<Value name="24">
<Value>endTime</Value>
</Value>
<Value name="25">
<Value>room</Value>
</Value>
<Value name="26">
<Value>notes</Value>
</Value>
<Value name="27">
<Value>pathology</Value>
</Value>
<Value name="28">
<Value>preparation</Value>
</Value>
<Value name="29">
<Value>enterRoomTime</Value>
</Value>
<Value name="30">
<Value>leaveRoomTime</Value>
</Value>
<Value name="31">
<Value>process</Value>
</Value>
</Data>
<DataLocation>{%%PARENT}("Items")</DataLocation>
<DefaultData>ProcedureItemDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Document.ProcedureC("Items")</IdLocation>
<IndexLocation>^HCC.SQL.Docu70F6.ProcedureItemI</IndexLocation>
<StreamLocation>^HCC.SQL.Docu70F6.ProcedureItemS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
