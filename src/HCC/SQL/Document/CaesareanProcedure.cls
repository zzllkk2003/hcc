/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 《宫剖产记录》使用的“手术操作章节”表。
/// 该手术操作章节非常特殊，因此独立为“宫剖产记录-手术操作章节”创建一个类/表
Class HCC.SQL.Document.CaesareanProcedure Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "47519-4";

Parameter SectionName = "HISTORY OF PROCEDURES";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 手术/操作代码
Property procedure As WS.DE.DE060009300 [ SqlFieldName = procd ];

/// 手术名称
Property procedureName As WS.DE.DE060009400 [ SqlFieldName = procd_name ];

/// 待产日期时间
Property dueDate As WS.DE.DE060019700 [ SqlFieldName = due_date ];

/// 胎膜完整情况标志
Property embryolemmaComplete As WS.DE.DE051015600 [ SqlFieldName = embryolemma_cmplt ];

/// 脐带长度（cm）
Property cordLength As WS.DE.DE043005500 [ SqlFieldName = cord_len ];

/// 绕颈身（周）
Property circles As WS.DE.DE043005900 [ SqlFieldName = circles ];

/// 产前诊断
Property diagnosis As WS.DE.DE051010900 [ SqlFieldName = diag ];

/// 手术指征
Property surgicalIndication As WS.DE.DE060034000 [ SqlFieldName = surgical_indic ];

/// 手术开始日期时间
Property beginTime As WS.DE.DE060022100 [ SqlFieldName = begin_time ];

/// 麻醉方法代码
Property anesthesiaMethod As WS.DE.DE060007300 [ SqlFieldName = anes_method ];

/// 麻醉体位
Property anesthesiaPosition As WS.DE.DE041026000 [ SqlFieldName = anes_pos ];

/// 麻醉效果
Property anesthesiaEffect As WS.DE.DE060025300 [ SqlFieldName = anes_effect ];

/// 剖宫产手术过程
Property process As WS.DE.DE051006300 [ SqlFieldName = process ];

/// 子宫情况
Property uterus As WS.DE.DE041023300 [ SqlFieldName = uterus ];

/// 胎方位代码
Property fetalPosition As WS.DE.DE050104400 [ SqlFieldName = fetal_pos ];

/// 胎儿娩出方式
Property deliveryMode As WS.DE.DE051017300 [ SqlFieldName = delivery_mode ];

/// 胎盘黄染
Property placentaYellow As WS.DE.DE051015300 [ SqlFieldName = placenta_yellow ];

/// 胎膜黄染
Property embryolemmaYellow As WS.DE.DE051015300 [ SqlFieldName = embryolemma_yellow ];

/// 脐带缠绕情况
Property cordEntanglement As WS.DE.DE043005400 [ SqlFieldName = cord_entangle ];

/// 脐带扭转（周）
Property cordTorsion As WS.DE.DE043005600 [ SqlFieldName = cord_torsion ];

/// 存脐带血情况标志
Property storeCordBlood As WS.DE.DE045013800 [ SqlFieldName = store_cord_blood ];

/// 子宫壁缝合情况
Property sutureUterineWall As WS.DE.DE060020000 [ SqlFieldName = suture_uterine_wall ];

/// 宫缩剂名称
Property oxytocin As WS.DE.DE085002200 [ SqlFieldName = oxytocin ];

/// 宫缩剂使用方法
Property oxytocinUsage As WS.DE.DE060013600 [ SqlFieldName = oxytocin_usage ];

/// 手术用药
Property medication As WS.DE.DE085002200 [ SqlFieldName = med ];

/// 手术用药量
Property medicationDose As WS.DE.DE060029300 [ SqlFieldName = med_dose ];

/// 腹腔探查子宫
Property uterusCheck As WS.DE.DE041023300 [ SqlFieldName = uterus_check ];

/// 腹腔探查附件
Property adnexalCheck As WS.DE.DE041004200 [ SqlFieldName = adnexal_check ];

/// 宫腔探查异常情况标志
Property abnormal As WS.DE.DE043005300 [ SqlFieldName = abnormal ];

/// 宫腔探查肌瘤标志
Property myomaCheck As WS.DE.DE051016600 [ SqlFieldName = myoma_check ];

/// 宫腔探查处理情况
Property treatment As WS.DE.DE043005200 [ SqlFieldName = treatment ];

/// 手术时产妇情况
Property puerperaSituation As WS.DE.DE051013400 [ SqlFieldName = puerpera_situ ];

/// 出血量（mL）
Property bleedingVolume As WS.DE.DE060009700 [ SqlFieldName = bleeding_vol ];

/// 输血成分
Property bloodTransComp As WS.DE.DE060026200 [ SqlFieldName = blood_trans_comp ];

/// 输血量（mL）
Property bloodTransVolume As WS.DE.DE060026700 [ SqlFieldName = blood_trans_vol ];

/// 输液量（mL）
Property infusionVolume As WS.DE.DE060026800 [ SqlFieldName = infusion_vol ];

/// 供氧时间（min）
Property oxygenLength As WS.DE.DE060031800 [ SqlFieldName = oxygen_len ];

/// 其他用药
Property otherMedication As WS.DE.DE085002200 [ SqlFieldName = other_med ];

/// 其他情况
Property otherSituation As WS.DE.DE060017900 [ SqlFieldName = other_situ ];

/// 手术结束日期时间
Property endTime As WS.DE.DE060021800 [ SqlFieldName = end_time ];

/// 手术全程时间（min）
Property length As WS.DE.DE060025900 [ SqlFieldName = len ];

Storage Default
{
<Data name="CaesareanProcedureDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>procedure</Value>
</Value>
<Value name="3">
<Value>procedureName</Value>
</Value>
<Value name="4">
<Value>dueDate</Value>
</Value>
<Value name="5">
<Value>embryolemmaComplete</Value>
</Value>
<Value name="6">
<Value>cordLength</Value>
</Value>
<Value name="7">
<Value>circles</Value>
</Value>
<Value name="8">
<Value>diagnosis</Value>
</Value>
<Value name="9">
<Value>surgicalIndication</Value>
</Value>
<Value name="10">
<Value>beginTime</Value>
</Value>
<Value name="11">
<Value>anesthesiaMethod</Value>
</Value>
<Value name="12">
<Value>anesthesiaPosition</Value>
</Value>
<Value name="13">
<Value>anesthesiaEffect</Value>
</Value>
<Value name="14">
<Value>process</Value>
</Value>
<Value name="15">
<Value>uterus</Value>
</Value>
<Value name="16">
<Value>fetalPosition</Value>
</Value>
<Value name="17">
<Value>deliveryMode</Value>
</Value>
<Value name="18">
<Value>placentaYellow</Value>
</Value>
<Value name="19">
<Value>embryolemmaYellow</Value>
</Value>
<Value name="20">
<Value>cordEntanglement</Value>
</Value>
<Value name="21">
<Value>cordTorsion</Value>
</Value>
<Value name="22">
<Value>storeCordBlood</Value>
</Value>
<Value name="23">
<Value>sutureUterineWall</Value>
</Value>
<Value name="24">
<Value>oxytocin</Value>
</Value>
<Value name="25">
<Value>oxytocinUsage</Value>
</Value>
<Value name="26">
<Value>medication</Value>
</Value>
<Value name="27">
<Value>medicationDose</Value>
</Value>
<Value name="28">
<Value>uterusCheck</Value>
</Value>
<Value name="29">
<Value>adnexalCheck</Value>
</Value>
<Value name="30">
<Value>abnormal</Value>
</Value>
<Value name="31">
<Value>myomaCheck</Value>
</Value>
<Value name="32">
<Value>treatment</Value>
</Value>
<Value name="33">
<Value>puerperaSituation</Value>
</Value>
<Value name="34">
<Value>bleedingVolume</Value>
</Value>
<Value name="35">
<Value>bloodTransComp</Value>
</Value>
<Value name="36">
<Value>bloodTransVolume</Value>
</Value>
<Value name="37">
<Value>infusionVolume</Value>
</Value>
<Value name="38">
<Value>oxygenLength</Value>
</Value>
<Value name="39">
<Value>otherMedication</Value>
</Value>
<Value name="40">
<Value>otherSituation</Value>
</Value>
<Value name="41">
<Value>endTime</Value>
</Value>
<Value name="42">
<Value>length</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.CaesareanPrABC2D</DataLocation>
<DefaultData>CaesareanProcedureDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.CaesareanPrABC2D</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.CaesareanPrABC2I</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.CaesareanPrABC2S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
