/// Author: QP
/// Version: 1.0
/// Date:2021/07/01
/// 产前检查章节表
Class HCC.SQL.Document.PrenatalEvent Extends (%Persistent, %XML.Adaptor)
{

Parameter SectionCode = "57073-9";

Parameter SectionName = "Prenatal events";

Parameter SectionCodeSystemOID = "2.16.840.1.113883.6.1";

Parameter SectionCodeSystem = "LOINC";

/// 文档编号 (同时作为Idkey)
Property DocumentNo As %String(XMLPROJECTION = "NONE");

Index IdDocNo On DocumentNo [ IdKey, Unique ];

/// 建立与HCC.SQL.Document.Header的外键
ForeignKey FKDocument(DocumentNo) References HCC.SQL.Document(IdKey);

/// 宫底高度
Property uterusFundusHeight As WS.DE.DE041006700 [ SqlFieldName = uterus_fundus_hgt ];

/// 腹围
Property abdominalCircum As WS.DE.DE041005200 [ SqlFieldName = abdominal_circum ];

/// 胎方位代码
Property fetalOrientation As WS.DE.DE050104400 [ SqlFieldName = fetal_ori ];

/// 胎心率
Property fetalHeartRate As WS.DE.DE041018300 [ SqlFieldName = fetal_heart_rate ];

/// 头位难产情况的评估
Property cephalicDystocia As WS.DE.DE051013500 [ SqlFieldName = cephalic_dystocia ];

/// 出口横径
Property outletTransverseDiameter As WS.DE.DE041024700 [ SqlFieldName = outlet_transverse_diam ];

/// 骶耻外径
Property sacralExternalDiameter As WS.DE.DE041017500 [ SqlFieldName = sacral_external_diam ];

/// 坐骨结节间径
Property ischialTubercleDiameter As WS.DE.DE041023900 [ SqlFieldName = ischial_tubercle_diam ];

/// 宫缩情况
Property uterineContraction As WS.DE.DE041024500 [ SqlFieldName = uterine_ctr ];

/// 宫颈厚度
Property cervicalThickness As WS.DE.DE041024800 [ SqlFieldName = cervical_thk ];

/// 宫口情况
Property uterineOrifice As WS.DE.DE041026500 [ SqlFieldName = uterine_orifice ];

/// 胎膜情况代码
Property fetalMembrane As WS.DE.DE051015500 [ SqlFieldName = fetal_membrane ];

/// 破膜方式代码
Property fetalMembraneBreaking As WS.DE.DE041025600 [ SqlFieldName = fetal_membrane_breaking ];

/// 先露位置
Property firstExposedPosition As WS.DE.DE041026200 [ SqlFieldName = first_exposed_pos ];

/// 羊水情况
Property amnioticFluid As WS.DE.DE043006200 [ SqlFieldName = amniotic_fluid ];

/// 膀胱充盈标志
Property bladderFilling As WS.DE.DE041025700 [ SqlFieldName = bladder_filling ];

/// 肠胀气标志
Property flatulence As WS.DE.DE040112300 [ SqlFieldName = flatulence ];

/// 检查方式代码
Property inspectionMethod As WS.DE.DE045013900 [ SqlFieldName = inspection_method ];

Storage Default
{
<Data name="PrenatalEventDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>gdgd</Value>
</Value>
<Value name="3">
<Value>fw</Value>
</Value>
<Value name="4">
<Value>tfw</Value>
</Value>
<Value name="5">
<Value>txl</Value>
</Value>
<Value name="6">
<Value>twncqkpg</Value>
</Value>
<Value name="7">
<Value>ckhj</Value>
</Value>
<Value name="8">
<Value>dcwj</Value>
</Value>
<Value name="9">
<Value>zgjjjj</Value>
</Value>
<Value name="10">
<Value>gsqk</Value>
</Value>
<Value name="11">
<Value>gjhd</Value>
</Value>
<Value name="12">
<Value>gkqk</Value>
</Value>
<Value name="13">
<Value>tmqk</Value>
</Value>
<Value name="14">
<Value>pmfs</Value>
</Value>
<Value name="15">
<Value>xlwz</Value>
</Value>
<Value name="16">
<Value>ysqk</Value>
</Value>
<Value name="17">
<Value>pgcy</Value>
</Value>
<Value name="18">
<Value>czq</Value>
</Value>
<Value name="19">
<Value>jcfs</Value>
</Value>
<Value name="20">
<Value>uterusFundusHeight</Value>
</Value>
<Value name="21">
<Value>abdominalCircum</Value>
</Value>
<Value name="22">
<Value>fetalOrientation</Value>
</Value>
<Value name="23">
<Value>fetalHeartRate</Value>
</Value>
<Value name="24">
<Value>cephalicDystocia</Value>
</Value>
<Value name="25">
<Value>outletTransverseDiameter</Value>
</Value>
<Value name="26">
<Value>sacralExternalDiameter</Value>
</Value>
<Value name="27">
<Value>ischialTubercleDiameter</Value>
</Value>
<Value name="28">
<Value>uterineContraction</Value>
</Value>
<Value name="29">
<Value>cervicalThickness</Value>
</Value>
<Value name="30">
<Value>uterineOrifice</Value>
</Value>
<Value name="31">
<Value>fetalMembrane</Value>
</Value>
<Value name="32">
<Value>fetalMembraneBreaking</Value>
</Value>
<Value name="33">
<Value>firstExposedPosition</Value>
</Value>
<Value name="34">
<Value>amnioticFluid</Value>
</Value>
<Value name="35">
<Value>bladderFilling</Value>
</Value>
<Value name="36">
<Value>flatulence</Value>
</Value>
<Value name="37">
<Value>inspectionMethod</Value>
</Value>
</Data>
<DataLocation>^HCC.SQL.Docu70F6.PrenatalEventD</DataLocation>
<DefaultData>PrenatalEventDefaultData</DefaultData>
<IdLocation>^HCC.SQL.Docu70F6.PrenatalEventD</IdLocation>
<IndexLocation>^HCC.SQL.Docu70F6.PrenatalEventI</IndexLocation>
<StreamLocation>^HCC.SQL.Docu70F6.PrenatalEventS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
