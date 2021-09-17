/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 阴道分娩章节表
Class HCC.SQL.Document.VaginalDelivery Extends (%Persistent, %XML.Adaptor, HCC.SQL.Base)
{

Parameter SectionCode = "57074-7";

Parameter SectionName = "labor and delivery process";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 预产期
Property dueDate As WS.DE.DE051009800 [ SqlFieldName = due_date ];

/// 临产日期时间
Property laborTime As WS.DE.DE060022400 [ SqlFieldName = labor_time ];

/// 胎膜破裂日期时间
Property fetalMembraneRupture As WS.DE.DE051015400 [ SqlFieldName = fetal_membrane_rupture ];

/// 前羊水性状
Property priorAmnioticFluidTraits As WS.DE.DE043005800 [ SqlFieldName = pr_amniotic_fluid_traits ];

/// 前羊水量（mL）
Property priorAamnioticFluidVolume As WS.DE.DE043005700 [ SqlFieldName = pr_amniotic_fluid_vol ];

/// 宫缩开始日期时间
Property uterineContractionTime As WS.DE.DE041025000 [ SqlFieldName = uterine_contraction_time ];

/// 第1产程时长（min）
Property firstStageDuration As WS.DE.DE060002100 [ SqlFieldName = fst_stage_drtn ];

/// 宫口开全日期时间
Property fullOpeningTime As WS.DE.DE041025000 [ SqlFieldName = full_opening_time ];

/// 第2产程时长（min）
Property secondStageDuration As WS.DE.DE060001900 [ SqlFieldName = sec_stage_drtn ];

/// 胎儿娩出日期时间
Property fetalDeliveryTime As WS.DE.DE020101400 [ SqlFieldName = fetal_delvr_time ];

/// 第3产程时长（min）
Property thirdStageDuration As WS.DE.DE060002000 [ SqlFieldName = thrd_stage_drtn ];

/// 胎盘娩出日期时间
Property placentaDeliveryTime As WS.DE.DE060027300 [ SqlFieldName = placenta_delvr_time ];

/// 总产程时长（min）
Property totalLaborDuration As WS.DE.DE041023600 [ SqlFieldName = tot_labor_drtn ];

/// 胎方位代码
Property fetalOrientation As WS.DE.DE050104400 [ SqlFieldName = fetal_ori ];

/// 胎儿娩出助产标志
Property midwifery As WS.DE.DE060031100 [ SqlFieldName = midwifery ];

/// 助产方式
Property midwiferyMode As WS.DE.DE060031200 [ SqlFieldName = midwifery_mode ];

/// 胎盘娩出情况
Property placentalDelivery As WS.DE.DE051015700 [ SqlFieldName = placental_delvr ];

/// 胎膜完整情况标志
Property fetalMembraneIntegrity As WS.DE.DE051015600 [ SqlFieldName = fetal_membrane_intg ];

/// 羊水性状
Property amnioticFluid As WS.DE.DE043006300 [ SqlFieldName = amniotic_fluid ];

/// 羊水量（mL）
Property amnioticFluidVolume As WS.DE.DE043006100 [ SqlFieldName = amniotic_fluid_vol ];

/// 脐带长度（cm）
Property umbilicalCordLength As WS.DE.DE043005500 [ SqlFieldName = umbilical_cord_len ];

/// 绕颈身（周）
Property aroundNeck As WS.DE.DE043005900 [ SqlFieldName = around_neck ];

/// 脐带异常情况标志
Property umbilicalCordAbnormal As WS.DE.DE051014500 [ SqlFieldName = umbilical_cord_abn ];

/// 产时用药
Property intrapartumMed As WS.DE.DE085002200 [ SqlFieldName = intrapartum_med ];

/// 预防措施
Property preventiveMeasure As WS.DE.DE060029500 [ SqlFieldName = prvnt_measure ];

/// 产妇会阴切开标志
Property perinealIncision As WS.DE.DE051016500 [ SqlFieldName = perineal_incision ];

/// 会阴切开位置
Property perinealIncisionPosition As WS.DE.DE041025200 [ SqlFieldName = perineal_incision_pos ];

/// 产妇会阴缝合针数
Property perinealSutureNumber As WS.DE.DE060001100 [ SqlFieldName = perineal_suture_num ];

/// 产妇会阴裂伤程度代码
Property perinealLacerationDegree As WS.DE.DE050100300 [ SqlFieldName = perineal_laceration_deg ];

/// 会阴血肿标志
Property perinealHematoma As WS.DE.DE041025300 [ SqlFieldName = perineal_hematoma ];

/// 会阴血肿大小
Property perinealHematomaSize As WS.DE.DE041025400 [ SqlFieldName = perineal_hematoma_size ];

/// 会阴血肿处理
Property perinealHematomaTreatment As WS.DE.DE060021300 [ SqlFieldName = perineal_hematoma_treat ];

/// 麻醉方法代码
Property anesthesiaMethod As WS.DE.DE060007300 [ SqlFieldName = anesth_method ];

/// 麻醉药物名称
Property anesthetics As WS.DE.DE085002200 [ SqlFieldName = anesth ];

/// 阴道裂伤标志
Property vaginalLaceration As WS.DE.DE051016300 [ SqlFieldName = vaginal_laceration ];

/// 阴道血肿标志
Property vaginalHematoma As WS.DE.DE051016400 [ SqlFieldName = vaginal_hematoma ];

/// 宫颈裂伤标志
Property cervicalLaceration As WS.DE.DE041024900 [ SqlFieldName = cervical_laceration ];

/// 宫颈缝合情况
Property cervicalSuture As WS.DE.DE060020000 [ SqlFieldName = cervical_suture ];

/// 产后用药
Property PostpartumMed As WS.DE.DE085002200 [ SqlFieldName = Postpartum_med ];

/// 分娩过程摘要
Property deliveryProcessSummary As WS.DE.DE060018200 [ SqlFieldName = delvr_proc_sum ];

/// 宫缩情况
Property uterineContraction As WS.DE.DE041024500 [ SqlFieldName = uterine_ctr ];

/// 子宫情况
Property uterineCondition As WS.DE.DE041023300 [ SqlFieldName = uterine_cond ];

/// 恶露状况
Property lochiaCondition As WS.DE.DE041002500 [ SqlFieldName = lochia_cond ];

/// 会阴情况
Property perinealCondition As WS.DE.DE051013700 [ SqlFieldName = perineal_cond ];

/// 修补手术过程
Property repairProcedure As WS.DE.DE060028400 [ SqlFieldName = repair_procd ];

/// 存脐带血情况标志
Property cordBloodPreserve As WS.DE.DE045013800 [ SqlFieldName = cord_blood_pres ];

Storage Default
{
<Data name="VaginalDeliveryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ycq</Value>
</Value>
<Value name="3">
<Value>lcrq</Value>
</Value>
<Value name="4">
<Value>tmplrq</Value>
</Value>
<Value name="5">
<Value>qysxz</Value>
</Value>
<Value name="6">
<Value>qysl</Value>
</Value>
<Value name="7">
<Value>gskssj</Value>
</Value>
<Value name="8">
<Value>dyccsc</Value>
</Value>
<Value name="9">
<Value>gkqksj</Value>
</Value>
<Value name="10">
<Value>deccsc</Value>
</Value>
<Value name="11">
<Value>tefmsj</Value>
</Value>
<Value name="12">
<Value>dsccsc</Value>
</Value>
<Value name="13">
<Value>tpmcsj</Value>
</Value>
<Value name="14">
<Value>zccsc</Value>
</Value>
<Value name="15">
<Value>tfw</Value>
</Value>
<Value name="16">
<Value>temczcbz</Value>
</Value>
<Value name="17">
<Value>zcfs</Value>
</Value>
<Value name="18">
<Value>tpmcqk</Value>
</Value>
<Value name="19">
<Value>tmwzqkbz</Value>
</Value>
<Value name="20">
<Value>ysxz</Value>
</Value>
<Value name="21">
<Value>ysl</Value>
</Value>
<Value name="22">
<Value>qdcd</Value>
</Value>
<Value name="23">
<Value>jrs</Value>
</Value>
<Value name="24">
<Value>qdycqkbz</Value>
</Value>
<Value name="25">
<Value>csyy</Value>
</Value>
<Value name="26">
<Value>yfcs</Value>
</Value>
<Value name="27">
<Value>cfhyqkbz</Value>
</Value>
<Value name="28">
<Value>hyqkwz</Value>
</Value>
<Value name="29">
<Value>cfhyfhzs</Value>
</Value>
<Value name="30">
<Value>cfhylscddm</Value>
</Value>
<Value name="31">
<Value>hyxzbz</Value>
</Value>
<Value name="32">
<Value>hyxzdx</Value>
</Value>
<Value name="33">
<Value>hyxzcl</Value>
</Value>
<Value name="34">
<Value>mzffdm</Value>
</Value>
<Value name="35">
<Value>mzywmc</Value>
</Value>
<Value name="36">
<Value>ydlsbz</Value>
</Value>
<Value name="37">
<Value>ydxzbz</Value>
</Value>
<Value name="38">
<Value>gjlsbz</Value>
</Value>
<Value name="39">
<Value>gjfhqk</Value>
</Value>
<Value name="40">
<Value>chyy</Value>
</Value>
<Value name="41">
<Value>fmgczy</Value>
</Value>
<Value name="42">
<Value>gsqk</Value>
</Value>
<Value name="43">
<Value>zgqk</Value>
</Value>
<Value name="44">
<Value>elzk</Value>
</Value>
<Value name="45">
<Value>hyqk</Value>
</Value>
<Value name="46">
<Value>xbssgc</Value>
</Value>
<Value name="47">
<Value>cqdxqkbz</Value>
</Value>
<Value name="48">
<Value>dueDate</Value>
</Value>
<Value name="49">
<Value>laborTime</Value>
</Value>
<Value name="50">
<Value>fetalMembraneRupture</Value>
</Value>
<Value name="51">
<Value>priorAmnioticFluidTraits</Value>
</Value>
<Value name="52">
<Value>priorAamnioticFluidVolume</Value>
</Value>
<Value name="53">
<Value>uterineContractionTime</Value>
</Value>
<Value name="54">
<Value>firstStageDuration</Value>
</Value>
<Value name="55">
<Value>fullOpeningTime</Value>
</Value>
<Value name="56">
<Value>secondStageDuration</Value>
</Value>
<Value name="57">
<Value>fetalDeliveryTime</Value>
</Value>
<Value name="58">
<Value>thirdStageDuration</Value>
</Value>
<Value name="59">
<Value>placentaDeliveryTime</Value>
</Value>
<Value name="60">
<Value>totalLaborDuration</Value>
</Value>
<Value name="61">
<Value>fetalOrientation</Value>
</Value>
<Value name="62">
<Value>midwifery</Value>
</Value>
<Value name="63">
<Value>midwiferyMode</Value>
</Value>
<Value name="64">
<Value>placentalDelivery</Value>
</Value>
<Value name="65">
<Value>fetalMembraneIntegrity</Value>
</Value>
<Value name="66">
<Value>amnioticFluid</Value>
</Value>
<Value name="67">
<Value>amnioticFluidVolume</Value>
</Value>
<Value name="68">
<Value>umbilicalCordLength</Value>
</Value>
<Value name="69">
<Value>aroundNeck</Value>
</Value>
<Value name="70">
<Value>umbilicalCordAbnormal</Value>
</Value>
<Value name="71">
<Value>intrapartumMed</Value>
</Value>
<Value name="72">
<Value>preventiveMeasure</Value>
</Value>
<Value name="73">
<Value>perinealIncision</Value>
</Value>
<Value name="74">
<Value>perinealIncisionPosition</Value>
</Value>
<Value name="75">
<Value>perinealSutureNumber</Value>
</Value>
<Value name="76">
<Value>perinealLacerationDegree</Value>
</Value>
<Value name="77">
<Value>perinealHematoma</Value>
</Value>
<Value name="78">
<Value>perinealHematomaSize</Value>
</Value>
<Value name="79">
<Value>perinealHematomaTreatment</Value>
</Value>
<Value name="80">
<Value>anesthesiaMethod</Value>
</Value>
<Value name="81">
<Value>anesthetics</Value>
</Value>
<Value name="82">
<Value>vaginalLaceration</Value>
</Value>
<Value name="83">
<Value>vaginalHematoma</Value>
</Value>
<Value name="84">
<Value>cervicalLaceration</Value>
</Value>
<Value name="85">
<Value>cervicalSuture</Value>
</Value>
<Value name="86">
<Value>PostpartumMed</Value>
</Value>
<Value name="87">
<Value>deliveryProcessSummary</Value>
</Value>
<Value name="88">
<Value>uterineContraction</Value>
</Value>
<Value name="89">
<Value>uterineCondition</Value>
</Value>
<Value name="90">
<Value>lochiaCondition</Value>
</Value>
<Value name="91">
<Value>perinealCondition</Value>
</Value>
<Value name="92">
<Value>repairProcedure</Value>
</Value>
<Value name="93">
<Value>cordBloodPreserve</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Do70F6.VaginalDeliC14FD</DataLocation>
<DefaultData>VaginalDeliveryDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Do70F6.VaginalDeliC14FD</IdLocation>
<IndexLocation>^HCC.SQL.Do70F6.VaginalDeliC14FI</IndexLocation>
<StreamLocation>^HCC.SQL.Do70F6.VaginalDeliC14FS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
