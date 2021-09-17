/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 互联互通文档配置
/// 用于配置和管理互联互通文档的78个章节
Class WS.DOC.SectionConfig Extends (%Persistent, %XML.Adaptor)
{

/// 章节编号
Property SectionNo As %String;

/// 章节名称
Property SectionName As %String(VALUELIST = ",一般状况检查章节,个人史/社会史章节,主要健康问题章节,主诉章节,产前检查章节,产后处置章节,会诊原因章节,会诊意见章节,住院史章节,住院过程章节,体格检查章节,健康指导章节,健康评估章节,入院信息章节,入院诊断章节,其他处置章节,其他相关信息章节,出院诊断章节,分娩评估章节,医嘱章节,卫生事件章节,器械物品核对章节,四肢章节,失血章节,实验室检查章节,家族史章节,尸检意见章节,引流章节,意见章节,手术操作章节,手术评估记录标志章节,手术过程描述章节,抢救记录章节,护理操作章节,护理标志章节,护理观察章节,护理记录章节,护理隔离章节,新生儿章节,既往史章节,月经史章节,术前总结章节,术前诊断章节,术后交接章节,术后去向章节,术后诊断章节,检查报告章节,检验报告章节,死亡原因章节,治疗计划章节,注意事项章节,现病史章节,生命体征章节,生活方式章节,用药章节,用药管理章节,病历摘要章节,症状章节,皮肤章节,知情同意章节,行政管理章节,讨论内容章节,讨论总结章节,诊断记录章节,费用章节,转科记录章节,辅助检查章节,输液章节,输血章节,过敏史章节,阴道分娩章节,预防接种史章节,风险章节,高值耗材章节,麻醉章节,预防接种史章节");

/// 章节说明
Property Description As %String(MAXLEN = 2000);

Index ukName On SectionName [ Unique ];

ClassMethod Init()
{
    d ..%KillExtent()
    Set tDesc="一般状况检查章节,个人史/社会史章节,主要健康问题章节,主诉章节,产前检查章节,产后处置章节,会诊原因章节,会诊意见章节,住院史章节,住院过程章节,体格检查章节,健康指导章节,健康评估章节,入院信息章节,入院诊断章节,其他处置章节,其他相关信息章节,出院诊断章节,分娩评估章节,医嘱章节,卫生事件章节,器械物品核对章节,四肢章节,失血章节,实验室检查章节,家族史章节,尸检意见章节,引流章节,意见章节,手术操作章节,手术评估记录标志章节,手术过程描述章节,抢救记录章节,护理操作章节,护理标志章节,护理观察章节,护理记录章节,护理隔离章节,新生儿章节,既往史章节,月经史章节,术前总结章节,术前诊断章节,术后交接章节,术后去向章节,术后诊断章节,检查报告章节,检验报告章节,死亡原因章节,治疗计划章节,注意事项章节,现病史章节,生命体征章节,生活方式章节,用药章节,用药管理章节,病历摘要章节,症状章节,皮肤章节,知情同意章节,行政管理章节,讨论内容章节,讨论总结章节,诊断记录章节,费用章节,转科记录章节,辅助检查章节,输液章节,输血章节,过敏史章节,阴道分娩章节,预防接种史章节,风险章节,高值耗材章节,麻醉章节,预防接种史章节"
    for i=1:1:76
    {
        Set t=..%New()
        Set t.SectionNo = "Sec"_i
        Set t.SectionName = $P(tDesc,",",i)
        Set t.Description =$P(tDesc,",",i)
        d t.%Save()
    }
}

Storage Default
{
<Data name="SectionConfigDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>SectionNo</Value>
</Value>
<Value name="3">
<Value>SectionName</Value>
</Value>
<Value name="4">
<Value>Description</Value>
</Value>
</Data>
<DataLocation>^WS.DOC.SectionConfigD</DataLocation>
<DefaultData>SectionConfigDefaultData</DefaultData>
<IdLocation>^WS.DOC.SectionConfigD</IdLocation>
<IndexLocation>^WS.DOC.SectionConfigI</IndexLocation>
<StreamLocation>^WS.DOC.SectionConfigS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
